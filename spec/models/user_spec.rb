require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'marios', fullname: 'mariosknl') }
  let(:user2) { User.new(username: 'kubi', fullname: 'kubilay') }
  let(:user3) { User.new(username: 'teo', fullname: 'teo_ntento') }
  let(:user4) { User.new(username: 'frank', fullname: 'frank_uganda') }
  let(:user5) { User.new(username: 'frank', fullname: 'frank_uganda') }

  describe 'validations' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'requires username to be valid' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'isnt valid if username is more than 30 characters' do
      user.username = 'marios' * 6
      expect(user).not_to be_valid
    end

    it 'username is unique' do
      user4.save
      expect(user5).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many following' do
      expect(user).to respond_to(:following?)
    end

    it 'has many followers' do
      expect(user).to respond_to(:followers)
    end

    it 'has many opinions' do
      expect(user).to respond_to(:opinions)
    end

    it 'has photo image' do
      expect(user).to respond_to(:photo)
    end

    it 'has cover image' do
      expect(user).to respond_to(:coverimage)
    end
  end

  describe 'user methods' do
    let(:user) { User.create(username: 'marios', fullname: 'mariosknl') }
    let(:user2) { User.create(username: 'teo', fullname: 'teo ntenti') }
    let(:user3) { User.create(username: 'kubilay', fullname: 'kubilay caglayan') }
    let(:follow) { Follow.create(followerid: user.id, followedid: user3.id) }
    let(:follow2) { Follow.create(followerid: user2.id, followedid: user3.id) }
    let(:follow3) { Follow.create(followerid: user.id, followedid: user2.id) }

    it 'follows a user' do
      follow
      expect(user.following?(user3)).to be true
    end

    it 'unfollows a user' do
      follow
      user.unfollow(user3)
      expect(user.following?(user3)).to be false
    end

    it 'shows the shared opinions' do
      follow
      user3.opinions.create(text: 'hi there friend')
      expect(user.opinions_showing).to eq(user3.opinions)
    end

    it 'returns true if photo is attached' do
      expect(user.photo).to be_valid
    end

    it 'returns true if coverimage is attached' do
      expect(user.coverimage).to be_valid
    end
  end
end
