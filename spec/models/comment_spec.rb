require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(username: 'marios', fullname: 'mariosknl') }
  let(:opinion) { Opinion.create(text: 'Welcome people', author_id: user.id) }
  let(:comment) { Comment.new(user_id: user.id, opinion_id: opinion.id, body: 'Nice to be here') }

  describe 'associations' do
    it 'belongs to a user' do
      expect(comment).to respond_to(:user)
    end

    it 'belongs to an opinion' do
      expect(comment).to respond_to(:opinion)
    end
  end

  describe 'validations' do
    it 'cant be without content' do
      comment.body = nil
      expect(comment).not_to be_valid
    end

    it 'must be up to 150 characters' do
      comment.body = 'xx' * 80
      expect(comment).not_to be_valid
    end
  end
end
