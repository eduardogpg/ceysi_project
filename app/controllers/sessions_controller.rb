class SessionsController < ApplicationController
  before_action :set_user

  def new
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private
    def set_user
      @user = User.find_by(username: params[:username])
    end

end
