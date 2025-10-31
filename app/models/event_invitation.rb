class EventInvitation < ApplicationRecord
  belongs_to :invited_to_event, class_name: "Event"
  belongs_to :invited_user, class_name: "User"

  enum status: { not_sent: 0, pending: 1, accepted: 2, declined: 3 }
end
