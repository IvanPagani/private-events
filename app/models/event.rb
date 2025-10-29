class Event < ApplicationRecord
  validates :title, :location, :event_datetime, presence: true

  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee
end
