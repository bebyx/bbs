class TopicsController < ApplicationController
  def new
  end

  def create
    @topic = Topic.new(topic_params)

    @topic.save
    redirect_to @topic
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :message)
    end 
end
