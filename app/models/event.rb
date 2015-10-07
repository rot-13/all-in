class Event < ActiveRecord::Base
  belongs_to :organizer, foreign_key: :user_id, class_name: 'User'
  has_many :rsvps
end
