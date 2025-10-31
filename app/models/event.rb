class Event < ApplicationRecord
  scope :past,     -> { where("event_datetime < ?",  Time.current).order(event_datetime: :desc) }
  scope :upcoming, -> { where("event_datetime >= ?", Time.current).order(event_datetime:  :asc) }
  scope :public_events, -> { where(private: false) }

  validates :title, :location, :event_datetime, presence: true

  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee

  has_many :event_invitations, foreign_key: :invited_to_event_id, dependent: :destroy
  has_many :invited_users, through: :event_invitations, source: :invited_user
end
