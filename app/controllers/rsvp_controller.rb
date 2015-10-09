class RsvpController < ApplicationController
  include EventConcern
  before_action :set_event

  def update
    if current_rsvp.update(rsvp_params)
      redirect_to @event, notice: 'RSVP Updated'
    else
      redirect_to @event, alert: 'FAIL'
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:response, :attendees)
  end

end
