class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    if @group.save
      flash[:success] = ["New group successfully created"]
      redirect_to group_url(@group)
    else
      flash[:errors] = @group.errors
      render :new
    end
  end

  def show
    @group = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    flash[:notice] = 'group Updated'
    redirect_to groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'group Removed'
    redirect_to groups_path
  end
end
