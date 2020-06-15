class RepliesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.create(reply_params)
    redirect_to board_topic_path(@topic.board_id, @topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @reply = Reply.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to board_topic_path(@topic.board_id, @topic)
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.find(params[:id])
    @reply.destroy
    redirect_to board_topic_path(@topic.board_id, @topic)
  end

  private
    def reply_params
      params.require(:reply).permit(:user, :body)
    end

end
