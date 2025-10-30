class Event < ApplicationRecord
  scope :past,     -> { where("event_datetime < ?",  Time.current).order(event_datetime: :desc) }
  scope :upcoming, -> { where("event_datetime >= ?", Time.current).order(event_datetime:  :asc) }
  scope :public_events, -> { where(private: false) }

  validates :title, :location, :event_datetime, presence: true

  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee

  # def self.past
  #  self.where("event_datetime < ?", Time.current).order(event_datetime: :desc)
  # end
  #
  # def self.upcoming
  #  self.where("event_datetime >= ?", Time.current).order(event_datetime: :asc)
  # end
end
