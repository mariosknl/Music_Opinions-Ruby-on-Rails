require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:user) { User.create(username: 'marios', fullname: 'mariosknl') }
  let(:user2) { User.create(username: 'teo', fullname: 'teo ntenti') }
  let(:follow) { Follow.create(followerid: user.id, followedid: user2.id) }
  let(:follow2) { Follow.create(followerid: user.id, followedid: user2.id) }

  describe 'associations' do
    it 'belongs to a follower' do
      expect(follow).to respond_to(:followerid)
    end

    it 'belongs to a followed' do
      expect(follow).to respond_to(:followedid)
    end
  end

  describe 'follow is unique' do
    it 'cant be created a new record' do
      follow
      expect { follow2 }.to raise_error
    end
  end
end
