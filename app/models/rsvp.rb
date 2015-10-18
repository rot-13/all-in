class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  enum response: [:in, :out]

  before_update { |rsvp| rsvp.attendees = 1 if rsvp.out? }

  after_save do |rsvp|
    Pusher.trigger("event_#{rsvp.event.token}", 'change', {})
  end
end
