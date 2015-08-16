class SessionsController < ApplicationController

  def new # login route, display the page for login
    @user = User.new
  end

  def create # redirect to homepage
    @user = User.find_by_credentials(
      user_params[:username],
      user_params[:password_hash]
    )
    if @user
      login(@user)
      redirect_to "/app"
    else
      flash[:errors] = ["Invalid credentials"]
      redirect_to :back
    end
  end

  def destroy # redirect to root
    logout(current_user)
    render json: {logged_out: true}
  end

end
