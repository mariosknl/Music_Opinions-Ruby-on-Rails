require 'rails_helper'

RSpec.describe 'Opinions Controller', type: :feature do
  before :each do
    user = User.new(username: 'marios', fullname: 'mariosknl')
    user.save

    user2 = User.new(username: 'teo', fullname: 'teo ntenti')
    user2.save

    user.follow(user2)
    visit '/'
    fill_in 'user[username]', with: 'marios'
    click_button 'Sign In'
  end

  describe 'controller action' do
    it 'shows all the opinions in the main page' do
      expect(page).to have_content('Share your opinion')
    end

    it 'sharing new opinion' do
      fill_in 'opinion[text]', with: 'Lets talk about music'
      click_button 'Create Opinion'
      expect(page).to have_content('Lets talk about music')
    end
  end
end
