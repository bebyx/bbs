class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(name: params[:name])
    @topics = @board.topics.order('IFNULL(bumped_at, created_at) DESC')
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find_by(name: params[:name])
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path
    else
      render new_board_path
    end
  end

  def update
    @board = Board.find_by(name: params[:name])

    if @board.update(board_params)
      redirect_to @board
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find_by(name: params[:name])
    @board.destroy

    redirect_to boards_path
  end

  private
    def board_params
      params.require(:board).permit(:name, :description)
    end

end
