require 'rails_helper'

RSpec.describe 'Sessions Controller', type: :feature do
  before :each do
    user = User.new(username: 'marios', fullname: 'mariosknl')
    user.save
    visit '/'
    fill_in 'user[username]', with: 'marios'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'signs in successfully' do
      expect(page).to have_content('marios')
    end

    it 'signs out successfully' do
      click_link 'Sign Out'
      expect(page).to have_content('Sign in with your username...')
    end
  end
end
