class Event < ActiveRecord::Base
  belongs_to :organizer, foreign_key: :user_id, class_name: 'User'
  has_many :rsvps

  TOKEN_LENGTH = 4
  after_initialize :set_default_values

  def to_param
    self.token
  end

  private

  def set_default_values
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
  end

end
