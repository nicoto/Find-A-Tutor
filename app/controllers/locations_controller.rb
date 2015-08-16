class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = ["New location successfully created"]
      redirect_to locations_path
    else
      flash[:errors] = @location.errors
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    flash[:notice] = 'Location Updated'
    redirect_to locations_path
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = 'Location Removed'
    redirect_to locations_path
  end

  def index
    @locations = Location.all
  end

  private
  def location_params
    params.require(:location).permit(:street, :suite, :city, :state, :zip, :name, :phone, :contact)
  end
end
