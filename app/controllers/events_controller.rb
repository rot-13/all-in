require_relative '../services/rsvp_counter'

class EventsController < ApplicationController
  include EventConcern

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  before_action :must_be_signed_in, only: [:index, :new, :create, :update, :destroy]

  def index
    @events = current_user.events
  end

  def show
    @rsvps = RsvpCounter.new(@event)
    session[:redirect_url] = event_path
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:title)
  end
end
