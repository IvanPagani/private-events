class User < ApplicationRecord
  scope :past,     -> { where("event_datetime < ?",  Time.current).order(event_datetime: :desc) }
  scope :upcoming, -> { where("event_datetime >= ?", Time.current).order(event_datetime:  :asc) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy

  has_many :event_attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendances, source: :attended_event

  has_many :event_invitations, foreign_key: :invited_user_id, dependent: :destroy
  has_many :invited_to_events, through: :event_invitations, source: :invited_to_event
end
