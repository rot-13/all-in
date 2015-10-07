class Rsvp < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  enum response: [:in, :out]
end
