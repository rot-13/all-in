module EventConcern
  extend ControllerSupport::Base

  helper_method :current_rsvp

  def set_event
    @event = Event.find_by(token: (params[:event_id] || params[:id]))
  end

  def current_rsvp
    @_rsvp ||= (@event.present? ? @event.rsvps.where(user: current_user).first_or_initialize : nil)
  end
end