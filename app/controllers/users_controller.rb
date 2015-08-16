class UsersController < ApplicationController

def new # get form
  @user.new
end

def create # post creation
  @user = User.new(user_params)
  @user.save

  flash[:notice] = 'Book Added'
  redirect_to users_path
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
  @users = User.find(params[:id])
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password_hash, :role, :grade, :school)
  end
end
