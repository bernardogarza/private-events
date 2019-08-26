require 'rails_helper'

RSpec.feature "Events", type: :feature do
  context 'Testing events controller' do
    before(:each) do
      User.create(user_name:'foo', email:'foo@bar.com')
      visit sessions_new_path
      within('form') do
        fill_in 'Email:', with: 'foo@bar.com'
      end
      click_button 'Log-in'
    end

    scenario 'Should create an event' do
      visit new_event_path
      within('form') do
        fill_in 'Title:', with: 'Title'
        fill_in 'Description:', with: 'Description'
        fill_in 'Location:', with: 'Location'
        fill_in 'Date:', with: '2019-10-10 22:00:00 UTC'
      end
      click_button 'Create Event'
      expect(page).to have_content('Event created!')
    end

    scenario 'Should fail' do
      visit new_event_path
      within('form') do
        fill_in 'Title:', with: ''
        fill_in 'Description:', with: 'Description'
        fill_in 'Location:', with: 'Location'
        fill_in 'Date:', with: '2019-10-10 22:00:00 UTC'
      end
      click_button 'Create Event'
      expect(page).to have_content("Title can't be blank")
    end
  end
end
