module EventsHelper

  def event_date(event)
    event.created_at.strftime('%b %d')
  end

end
