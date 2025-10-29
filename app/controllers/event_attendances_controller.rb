class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  def create
    event = Event.find(params[:event_id])

    current_user.event_attendances.create!(attended_event: event)
    redirect_to event
  end

  def destroy
    # attendance = EventAttendance.find(params[:id]) not recommended
    # Insecure Direct Object Reference

    # a logged-in user could (by changing the URL manually) delete someone else’s attendance:
    # DELETE /event_attendances/5

    attendance = current_user.event_attendances.find(params[:id])
    event = attendance.attended_event
    attendance.destroy
    redirect_to event
  end
end
