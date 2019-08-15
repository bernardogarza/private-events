class Event < ApplicationRecord
    validates :title, :description, :location, :date, presence: true

    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    has_many :attendee, through: :user
end
