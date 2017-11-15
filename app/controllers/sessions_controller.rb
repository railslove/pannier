class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:user_id] = user.id

      flash[:notice] = 'Logged in!'
      redirect_to :root # Hier umleiten auf user#show
    else
      flash.now[:alert] = 'Email is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: 'Logged out!'
  end
end
