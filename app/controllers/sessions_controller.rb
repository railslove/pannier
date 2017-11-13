class SessionsController < ApplicationController
  def new; end

  def create; end

  def delete; end

  def login
    @user = user_params
  end

end
