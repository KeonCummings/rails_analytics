class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  # private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def page_token
    User.get_page_token(current_user.oauth_token)
  end

  def page_info
    @insights = User.page_insights(page_token)
  end

  helper_method :current_user, :current_metrics
end