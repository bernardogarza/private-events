# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing User Modedl' do
    it 'Validate Username' do
      user = User.new(user_name: '', email: 'foo@bar.com').save
      expect(user).to eq(false)
    end

    it 'Validate Email' do
      user = User.new(user_name: 'foo', email: '').save
      expect(user).to eq(false)
    end

    it 'Validate everything' do
      user2 = User.new(user_name: 'bar', email: 'foo@bar.com').save
      expect(user2).to eq(true)
    end
  end
end
