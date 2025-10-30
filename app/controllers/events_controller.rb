class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.expect(event: [ :title, :location, :event_datetime, :private ])
  end

  def authorize_user!
    redirect_to events_path,
    alert: "You are not authorized to modify this event." unless @event.creator == current_user
  end
end
