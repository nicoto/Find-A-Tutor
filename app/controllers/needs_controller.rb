class NeedsController < ApplicationController
  def new
   @subject_options = Subject.all.map{|s| [s.name, s.id]}
   @need = Need.new
  end

  def edit
    @subject_options = Subject.all.map{|s| [s.name, s.id]}
    @need = Need.find_by(id: params[:id])
  end

  def create
    @subject = Subject.find_by(id: params[:subject_id])

    #map back to users and subject
    @need = Need.new(description: params[:description])
    if @need.save
      redirect_to @need
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    
  end

  def index
   
  end

  def show
  end

  private
  def author_params
    
  end
end
