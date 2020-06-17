require 'rails_helper'

RSpec.describe 'Users Controller', type: :feature do
  before :each do
    user = User.create(username: 'marios', fullname: 'mariosknl')
    user.save

    user2 = User.create(username: 'teo', fullname: 'teo ntenti')
    user2.save

    visit '/'
    fill_in 'user[username]', with: 'marios'
    click_button 'Sign In'
  end

  describe 'controller actions' do
    it 'shows all users' do
      expect(page).to have_content('marios')
      expect(page).to have_content('teo')
    end

    it 'shows user page' do
      click_link 'marios'
      expect(page). to have_content('Opinions shared....')
    end

    it 'creates a new user' do
      click_link 'Sign Out'
      click_link 'Sign Up'
      fill_in 'user[username]', with: 'kubilay'
      fill_in 'user[fullname]', with: 'kubilay caglayan'
      click_button 'Create User'
      expect(page).to have_content('kubilay')
    end

    it 'shows the edit user page' do
      click_link 'marios'
      click_link 'Edit User Account'
      expect(page).to have_button('Update User')
    end
  end
end
