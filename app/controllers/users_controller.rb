class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @past_events = @user.created_events.select { |event| event.event_datetime < Time.current }
    @upcoming_events = @user.created_events.select { |event| event.event_datetime >= Time.current }

     @received_invitations = @user.event_invitations.includes(:invited_to_event)
  end
end
