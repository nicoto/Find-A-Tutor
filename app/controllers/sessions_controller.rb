class SessionsController < ApplicationController

  def new # login route, display the page for login
    redirect_to events_path if logged_in?
    @user = User.new
  end

  def create # redirect to homepage
    if logged_in?
      redirect_to events_path
    else
      @user = User.find_by(username: params[:user][:username])
      login(@user)
      redirect_to events_path
    end
  end

  def destroy # redirect to root
    logout(current_user)
    render json: {logged_out: true}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
