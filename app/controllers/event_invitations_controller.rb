class EventInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [ :new, :create ]

  def new
    @invitation = @event.event_invitations.build

    invited_user_ids = @event.invited_users.pluck(:id)
    @eligible_users = User.where.not(id: invited_user_ids + [ current_user.id ])
  end

  def create
    @invitation = @event.event_invitations.build(invitation_params)
    if @invitation.save
      redirect_to @event, notice: "Invitation sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    Rails.logger.info "PARAMS => #{params.inspect}"
    @invitation = EventInvitation.find_by(id: params[:event_id])
    @event = Event.find_by(id: @invitation.invited_to_event_id)
    puts "INVITATION => #{@invitation.inspect}"

    if @invitation.update(status: params[:status])
      if @invitation.accepted?
        EventAttendance.find_or_create_by!(
          attendee: current_user,
          attended_event: @event
        )
      end

      redirect_to user_path(current_user), notice: "Invitation updated!"
    else
      redirect_to user_path(current_user), alert: "Failed to update invitation."
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def invitation_params
    params.expect(event_invitation: [ :invited_user_id, :status ])
  end
end
