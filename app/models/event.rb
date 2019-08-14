class Event < ApplicationRecord
    validates :title, :description, :location, :date, presence: true

    belongs_to :creator, class: 'user'
end
