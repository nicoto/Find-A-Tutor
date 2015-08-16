class commentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = Event.find(params[:event_id])
    if @comment.save
      flash[:success] = ['Comment successfully created']
      redirect_to comment_url(@comment)
    else
      flash.now[:errors] = @comment.errors
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = 'Comment Updated'
    redirect_to comments_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment Removed'
    redirect_to comments_path
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
