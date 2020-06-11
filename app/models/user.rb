class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
end
