class UsersController < ApplicationController

def new
  @user = User.new
end

def index
  @user = User.all
  render :index
end

def create
  @user = User.new(user_params)
  @user.save
  flash[:notice] = 'User Added'
  redirect_to events_path
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  flash[:notice] = 'User Updated'
  redirect_to users_path
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  flash[:notice] = 'User Removed'
  redirect_to users_path
end

def index # list of all
  @users = User.all
end

def show # individual
  @user = User.find(params[:id])
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :role, :grade, :school, :email)
  end
end
