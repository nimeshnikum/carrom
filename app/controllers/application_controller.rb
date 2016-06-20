class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  protect_from_forgery with: :exception
  helper_method :current_tournament

  def current_tournament
    session[:current_tournament] ||= Tournament.last.id
    @current_tournament ||= Tournament.find(session[:current_tournament])
  end
end
