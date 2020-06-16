class ApplicationController < ActionController::Base

  before_action :set_menu_items

  def set_menu_items
    @menu_boards =  Board.all
  end
end
