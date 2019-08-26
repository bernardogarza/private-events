require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Testing Users Controller' do
    scenario 'Should be success' do
      visit users_new_path
      within('form') do
        fill_in 'Username:', with: 'foo'
        fill_in 'Email:', with: 'foo@bar.com'
      end
      click_button 'Sign Up'
      expect(page).to have_content('Log Out')
    end
    scenario 'Should fail' do
      visit users_new_path
      within('form') do
        fill_in 'Username:', with: 'foo'
        fill_in 'Email:', with: 'foo@bar'
      end
      click_button 'Sign Up'
      expect(page).to have_content('Email is invalid')
    end
  end
end
