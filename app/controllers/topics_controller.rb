class TopicsController < ApplicationController

  def show
    @board = Board.find_by(name: params[:board_name])
    @topic = Topic.find(params[:id])
  end

  def edit
    @board = Board.find_by(name: params[:board_name])
    @topic = Topic.find(params[:id])
  end

  def create
    @board = Board.find_by(name: params[:board_name])
    @topic = @board.topics.create(topic_params)
    redirect_to board_path(@board)
  end

  def update
    @board = Board.find_by(name: params[:board_name])
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to board_topic_path(@board, @topic)
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find_by(name: params[:board_name])
    @topic = @board.topics.find(params[:id])
    @topic.destroy
    redirect_to board_path(@board)
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :user, :message)
    end
end
