class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  enum response: [:in, :out]

  before_update { |rsvp| rsvp.attendees = 1 if rsvp.out? }
end
