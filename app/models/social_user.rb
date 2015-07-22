class SocialUser < ActiveRecord::Base
	def self.from_omniauth(auth)
	    SocialUser.where(auth.slice(:provider, :uid)).first_or_initialize do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.save!
	    end
	end
end
