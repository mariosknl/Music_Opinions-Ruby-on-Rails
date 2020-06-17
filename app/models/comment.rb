class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion
  validates :body, presence: true, allow_blank: false, length: { maximum: 150 }
end
