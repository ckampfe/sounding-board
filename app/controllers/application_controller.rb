class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def current_user=(user)
    session[:current_user_id] = user.id
  end

end
