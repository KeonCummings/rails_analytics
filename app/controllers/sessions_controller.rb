class SessionsController < ApplicationController
  def index
  end

  def metrics
    @metrics = page_info
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to metrics_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
