# frozen_string_literal: true

class Event < ApplicationRecord
  validates :description, :location, :date, presence: true
  validates :title, uniqueness: true, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  scope :past_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date >= ?', Time.now) }
end
