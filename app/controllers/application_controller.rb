class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # require login

  before_action :require_login

  def logged_in?
    @current_user.present?
  end

  helper_method :logged_in?

  def require_login
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to :root, notice: 'Login required!'
  end

  attr_reader :current_user
end
