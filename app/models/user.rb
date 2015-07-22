class User < ActiveRecord::Base
  # validates :name, presence: true
  # validates :email, presence: true
  # validates :password, length: { in: 6..20 }

  def self.from_omniauth(auth)
    User.where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end


