class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :followerid, class_name: 'User'
  belongs_to :followed, foreign_key: :followedid, class_name: 'User'
end
