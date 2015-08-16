class GroupsController < ApplicationController

  def new
    @group = Group.new(group_params)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = ["New group successfully created"]
      redirect_to group_url(@group)
    else
      flash[:errors] = @group.errors
      render :new
    end
  end

  def show
    @group = Group.includes(:events).find(params[:id])

  end

  private
  def group_params
    # require(:group).permit(:)
  end

end
