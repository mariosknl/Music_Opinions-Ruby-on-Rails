class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

  has_one_attached :coverimage

  has_one_attached :photo

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy

  has_many :received_follows, foreign_key: 'followedid', class_name: 'Follow'

  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :followerid, class_name: 'Follow'

  has_many :followings, through: :given_follows, source: :followed
end
