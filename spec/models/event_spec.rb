# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Testing Event Model' do
    before(:each) do
      @user = User.create(user_name: 'foo', email: 'foo@bar.com')
    end

    it 'Validate Title' do
      event = @user.events.build(title: '', description: 'description', date: '2018-10-10 17:30:00 UTC', location: 'location').save
      expect(event).to eq(false)
    end

    it 'Validate Description' do
      event = @user.events.build(title: 'title', description: '', date: '2018-10-10 17:30:00 UTC', location: 'location').save
      expect(event).to eq(false)
    end

    it 'Validate Date' do
      event = @user.events.build(title: 'Title', description: 'description', date: '', location: 'location').save
      expect(event).to eq(false)
    end

    it 'Validate Location' do
      event = @user.events.build(title: 'Title', description: 'description', date: '2018-10-10 17:30:00 UTC', location: '').save
      expect(event).to eq(false)
    end
  end
end
