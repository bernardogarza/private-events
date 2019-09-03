# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  context 'Testing sessions controller' do
    before(:each) do
      @user = User.create(user_name: 'foo', email: 'foo@bar.com')
    end
    scenario 'Should log in' do
      visit sessions_new_path
      within('form') do
        fill_in 'Email:', with: 'foo@bar.com'
      end
      click_button 'Log-in'
      expect(page).to have_content('Log Out')
    end
    scenario 'Should fail' do
      visit sessions_new_path
      within('form') do
        fill_in 'Email:', with: 'foo@bar'
      end
      click_button 'Log-in'
      expect(page).to have_content('Invalid e-mail')
    end
  end
end
