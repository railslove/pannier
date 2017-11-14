class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_user

  def logged_in?
    @current_user.present?
  end

  helper_method :logged_in?

  def load_user
    if session[:user_id]
      @current_user = @current_user || User.find(session[:user_id])
    end
  end


end
