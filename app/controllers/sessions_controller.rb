
class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id
      flash[:secondary] = 'Welcome back!'
      redirect_to controller: 'users', action: 'show' # user_show_path
    else
      flash[:danger] = 'Email is invalid.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = 'Logged out!'
    redirect_to :root
  end
end
