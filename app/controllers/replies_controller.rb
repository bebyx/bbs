class RepliesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.create(reply_params)

    if reply_params[:sage] == "0"
      flash[:notice] = "===Touched==="
      @topic.touch(:bumped_at)
    end

    @board = Board.find_by(name: params[:board_name])
    redirect_to board_topic_path(@board.name, @topic)
  end

  def edit
    @board = Board.find_by(name: params[:board_name])
    @topic = Topic.find(params[:topic_id])
    @reply = Reply.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      @board = Board.find_by(name: params[:board_name])
      redirect_to board_topic_path(@board.name, @topic)
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.find(params[:id])
    @reply.destroy

    @board = Board.find_by(name: params[:board_name])
    redirect_to board_topic_path(@board.name, @topic)
  end

  private
    def reply_params
      params.require(:reply).permit(:user, :body, :sage)
    end

end
