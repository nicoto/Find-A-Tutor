class NeedsController < ApplicationController

  def index
    bounce
    @needs = current_user.needs  
  end

  def show
    bounce
    @need = Need.find(params[:id])
  end

  def new
    bounce
   @subject_options = Subject.all.map{|s| [s.name, s.id]}
   @need = Need.new
  end

  def edit
    bounce
    @subject_options = Subject.all.map{|s| [s.name, s.id]}
    @need = Need.find(params[:id])
  end

  def create
    bounce
    @need = current_user.needs.new(need_params)
    if @need.save
      redirect_to @need
    else
      render 'new'
    end
  end

  def update
    bounce
    @need = Need.find(params[:id])
    if @need.update(need_params)
      redirect_to @need
    else
      render 'edit'
    end
  end

  def destroy
    bounce
    @need = Need.find(params[:id])
    @need.destroy

    redirect_to needs_path
  end

  private
  def need_params
    params.require(:need).permit(:description, :subject_id)
  end

end
