module EventsHelper

  def event_date(event)
    event.created_at.strftime('%b %d')
  end

  def whatsapp_link(event)
    "whatsapp://send?text=#{event.title}! Who's in? - #{event_url}"
  end
end
