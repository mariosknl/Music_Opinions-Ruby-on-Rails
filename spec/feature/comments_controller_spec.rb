require 'rails_helper'

RSpec.describe 'Comments Controller', type: :feature do
  before :each do
    user = User.new(username: 'marios', fullname: 'mariosknl')
    user.save

    user2 = User.new(username: 'teo', fullname: 'teo ntenti')
    user2.save

    opinion = Opinion.new(text: "Rock'n'Roll", author_id: user.id)
    opinion.save

    opinion2 = Opinion.new(text: 'Make Love Not War', author_id: user2.id)
    opinion2.save

    user.follow(user2)

    visit '/'
    fill_in 'user[username]', with: 'marios'
    click_button 'Sign In'
  end

  describe 'actions' do
    it 'allows users to leave their comments' do
      expect(page).to have_button('Comment')
    end

    it 'creates comment' do
      within first('#new_comment') do
        fill_in 'comment[body]', with: 'Yeah babe'
        click_button('Comment')
      end
      expect(page).to have_content('Yeah babe')
    end
  end
end
