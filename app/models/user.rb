class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.get_page_token(user_token)
  	user_metrics = Koala::Facebook::API.new(user_token)
  	pages = user_metrics.get_connections('me', 'accounts')
    first_page_token = pages.first['access_token']
  end

  def self.page_insights(page_token)
    @page_graph = Koala::Facebook::API.new(page_token)
    #get page insights data
    @page_graph.get_connections('me', 'insights/page_posts_impressions', since:'2014-01-01', until: '2014-03-31')
    #get page feed data
    # @page_graph.get_connections('me', 'feed')
    #get page post data
    # @page_graph.get_connections('365182493518892', 'insights', since:'2014-01-01', until: '2014-01-31')
  end
end


