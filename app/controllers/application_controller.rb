class ApplicationController < ActionController::Base
  protect_from_forgery

  include ControllerHelper

  def index
  end
end
