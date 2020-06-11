class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }

end
