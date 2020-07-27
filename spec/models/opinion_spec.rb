require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user) { User.create(username: 'marios', fullname: 'mariosknl') }
  let(:opinion) { Opinion.new(text: 'Hi there!', author_id: user.id) }

  describe 'validations' do
    it 'test must be less than 150 characters' do
      opinion.text = 'xx' * 80
      expect(opinion).not_to be_valid
    end

    it 'must have content' do
      opinion.text = nil
      expect(opinion).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(opinion).to respond_to(:user)
    end

    it 'has many comments' do
      expect(opinion).to respond_to(:comments)
    end
  end
end
