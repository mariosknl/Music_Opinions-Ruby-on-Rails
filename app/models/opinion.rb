class Opinion < ApplicationRecord
  validates :text, length: { maximum: 150 }, presence: true
  belongs_to :user, foreign_key: 'author_id'
end
