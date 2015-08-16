class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = ["New group successfully created"]
      redirect_to groups_path
    else
      flash[:errors] = @group.errors
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    flash[:notice] = 'Group Updated'
    redirect_to groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'group Removed'
    redirect_to groups_path
  end

  def index
    @groups = Group.all
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
