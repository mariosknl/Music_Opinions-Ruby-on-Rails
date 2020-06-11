class User < ApplicationRecord
  has_one_attached :coverimage

  has_one_attached :photo

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :received_follows, foreign_key: 'followedid', class_name: 'Follow'

  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :followerid, class_name: 'Follow'

  has_many :followings, through: :given_follows, source: :followed

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

  validates :photo, :coverimage, presence: true

  validate :image_type

  def thumbnail(photo)
    return self.photo.variant(resize: '100x100!').processed
  end

  def top(coverimage)
    return self.coverimage.variant(resize: '100%x35%!').processed
  end

  private
  def image_type
    if photo.attached? == false
      errors.add(:photo, 'is missing!')
    end
    if !photo.content_type.in?(%('image/jpeg image/png'))
      errors.add(:photo, 'needs to be JPEG or PNG or JPG')
    end
  end
end
