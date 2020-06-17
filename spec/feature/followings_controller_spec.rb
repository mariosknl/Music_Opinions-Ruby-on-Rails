require 'rails_helper'
RSpec.describe 'Followings Controller', type: :feature do
  before :each do
    user = User.new(username: 'marios', fullname: 'mariosknl')
    user.save

    user2 = User.new(username: 'teo', fullname: 'teo ntenti')
    user2.save

    visit '/'
    fill_in 'user[username]', with: 'marios'
    click_button 'Sign In'
  end

  describe 'actions' do
    it 'follows a user' do
      click_link 'Follow'
      expect(page). to have_content('Unfollow')
    end

    it 'unfollows a user' do
      click_link 'Follow'
      click_link 'Unfollow'
      expect(page).to have_content('Follow')
    end
  end
end
