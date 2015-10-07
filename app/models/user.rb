class User < ActiveRecord::Base
  has_many :events
  has_many :rsvps

  def self.from_facebook(auth)
    where(facebook_id: auth.uid).first_or_initialize.tap do |user|
      user.facebook_id = auth.uid
      user.name = auth.info.name
      user.photo_url = auth.info.image
      user.save!
    end
  end
end
