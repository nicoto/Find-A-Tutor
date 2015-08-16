class EventsController < ApplicationController

  def new
    @event = Event.new(event_params)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = ["Event successfully created"]
      redirect_to event_url(@event)
    else
      flash.now[:errors] = @event.errors
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    render :index
  end

  def search
    @events = Event.where('description LIKE %?% AND zipcode = ?',
      params[:description], params[:zipcode])
  end

  private

  def event_params
    # params.require(:event).permit(:)
  end

end
