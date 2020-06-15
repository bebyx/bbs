class AddBoardRefToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :board, null: false, foreign_key: true
  end
end
