class EventInvitation < ApplicationRecord
  belongs_to :invited_to_event, class_name: "Event"
  belongs_to :invited_user, class_name: "User"

  enum :status, { pending: 0, accepted: 1, declined: 2 }
end
