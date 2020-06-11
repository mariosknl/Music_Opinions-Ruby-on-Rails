class User < ApplicationRecord
  has_one_attached :coverimage

  has_one_attached :photo

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :received_follows, foreign_key: 'followedid', class_name: 'Follow'

  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :followerid, class_name: 'Follow'

  has_many :followings, through: :given_follows, source: :followed

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

  validates :photo, presence: true, blob: { content_type: ['image/png',
                                                           'image/jpg',
                                                           'image/jpeg'],
                                            size_range: 1..3.megabytes }

  validates :coverimage, presence: true, blob: { content_type: ['image/png',
                                                                'image/jpg',
                                                                'image/jpeg'],
                                                 size_range: 1..3.megabytes }

  def thumbnail(_photo)
    photo.variant(resize: '100x100!').processed
  end

  def top(_coverimage)
    coverimage.variant(resize: '80%x25%!').processed
  end
end
