class NeedsController < ApplicationController
  def new
   @subject_options = Subject.all.map{|s| [s.name, s.id]}
   @need = Need.new
  end

  def create
    @subject = Subject.find_by(id: params[:subject_id])

    #map back to users
    @subject.needs.create(description: params[:description])
  end

  def update
    
  end

  def edit
    
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
