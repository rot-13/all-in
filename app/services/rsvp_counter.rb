class RsvpCounter

  attr_reader :in, :out, :in_count, :out_count

  def initialize(event)
    @event = event
    @rsvps = @event.rsvps.includes(:user).all
    @in = @rsvps.select(&:in?)
    @in_count = @in.map(&:attendees).inject(&:+) || 0
    @out = @rsvps.select(&:out?)
    @out_count = @out.map(&:attendees).inject(&:+) || 0
  end

end