class ApplicationController < ActionController::Base
  # protect_from_forgery
  
  # private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_auth_token
  	@page_token = params[:id]
  end

  helper_method :current_user
end