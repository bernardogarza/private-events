class Event < ApplicationRecord
    validates :title, :description, :location, :date, presence: true

    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

    has_many :attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :attendances

    scope :past_events, -> { where('date < ?', Time.now)}
    scope :upcoming_events, -> { where('date >= ?', Time.now)}  
end
