class NeedsController < ApplicationController

  def index
    @needs = current_user.needs  
  end

  def show
    @need = Need.find(params[:id])
  end

  def new
   @subject_options = Subject.all.map{|s| [s.name, s.id]}
   @need = Need.new
  end

  def edit
    @subject_options = Subject.all.map{|s| [s.name, s.id]}
    @need = Need.find(params[:id])
  end

  def create
    @need = current_user.needs.new(need_params)
    if @need.save
      redirect_to @need
    else
      render 'new'
    end
  end

  def update
    @need = Need.find(params[:id])
    if @need.update(need_params)
      redirect_to @need
    else
      render 'edit'
    end
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy

    redirect_to needs_path
  end

  private
  def need_params
    params.require(:need).permit(:description, :subject_id)
  end

end
