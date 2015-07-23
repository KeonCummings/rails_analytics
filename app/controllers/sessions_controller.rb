class SessionsController < ApplicationController
  def index
  end

  def impressions
  end

  def pick_page
  end

  def engagements
  end

  def viral
  end

  def create
    user = SocialUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to select_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
