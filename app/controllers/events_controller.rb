class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      current_user.groups.last.events << @event
      flash[:success] = ["Event successfully created"]
      redirect_to event_url(@event)
    else
      flash.now[:errors] = @event.errors
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = 'event Updated'
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event Removed'
    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
    # @comment = Comment.new
    # @comment.description = params[:description]
    # @comment.user_id = current_user.id
    # @comment.event_id = Event.find(params[:event_id])
    # if @comment.save
    #   flash[:success] = ['Comment successfully created']
    #   redirect_to comment_url(@comment)
    # else
    #   flash.now[:errors] = @comment.errors
    #   render :new
    # end
    # @comments = Comment.where(event_id: params[:id])
  end

  def index
    @events = Event.all
    @user = User.find(session[:user_id])
    render :index
  end

  # def search
  #   @events = Event.(:location).where('events.description LIKE ? OR events.name LIKE ? AND locations.zip = ?',
  #     "%#{search_params[:zipcode]}%", "%#{search_params[:term]}%", "%#{search_params[:zipcode]}%")
  # end

  private
  def search_params
    params.require(:search).permit(:term, :zipcode)
  end

  def event_params
    params.require(:event).permit(:name, :attendees, :time_start, :time_end,
      :description, :subject_id, :location_id, :event_id, :group_id, :user_id)
  end

end
