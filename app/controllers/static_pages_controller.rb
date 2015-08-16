class StaticPagesController < ApplicationController

  def root
    @user = User.new
  end

  def new_student
    @user = User.new

  end

  def new_tutor
    @user = User.new
  end

end
