class User < ApplicationRecord
  has_one_attached :coverimage
  after_commit :add_default_coverimage, on: %i[create update]

  has_one_attached :photo
  after_commit :add_default_photo, on: %i[create update]

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :received_follows, foreign_key: 'followedid', class_name: 'Follow'

  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :followerid, class_name: 'Follow'

  has_many :followings, through: :given_follows, source: :followed

  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

  validates :photo, blob: { content_type: ['image/png',
                                           'image/jpg',
                                           'image/jpeg'],
                            size_range: 0..1.megabytes }

  validates :coverimage, blob: { content_type: ['image/png',
                                                'image/jpg',
                                                'image/jpeg'],
                                 size_range: 0..1.megabytes }

  def thumbnail(_photo)
    if photo.attached?
      photo.variant(resize: '100x100!').processed
    else
      '/default_profile.jpg'
    end
  end

  def top(_coverimage)
    if coverimage.attached?
      coverimage.variant(resize: '70%x50%!').processed
    else
      '/default_coverimage.jpg'
    end
  end

  def smaller(_photo)
    if photo.attached?
      photo.variant(resize: '50x50!').processed
    else
      '/default_profile.jpg'
    end
  end

  def follow(user)
    following = Follow.new(followerid: id, followedid: user.id)
    following.save
  end

  def unfollow(user)
    Follow.where(followerid: id, followedid: user.id).first.destroy
  end

  def following?(user)
    !Follow.where(followerid: id, followedid: user.id).empty?
  end

  def opinions_showing
    ids = followings.ids << id
    Opinion.where(author_id: ids).order(id: :desc)
  end

  private

  def add_default_coverimage
    return if coverimage.attached?

    coverimage.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default_coverimage.jpg'
        )
      ),
      filename: 'default_coverimage.jpg',
      content_type: 'image/jpg'
    )
  end

  def add_default_photo
    return if photo.attached?

    photo.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default_profile.jpg'
        )
      ),
      filename: 'default_profile.jpg',
      content_type: 'image/jpg'
    )
  end
end
