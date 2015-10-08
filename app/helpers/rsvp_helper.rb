module RsvpHelper

  def avatar_url(rsvp)
    rsvp.user.photo_url
  end

  def name(rsvp)
    rsvp.user.name
  end

  def extra_attendees(rsvp)
    extra = rsvp.attendees - 1
    return nil if extra <= 0
    I18n.translate('rsvp.extra-attendees', count: extra)
  end

end