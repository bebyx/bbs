class AddBumpedAtToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :bumped_at, :timestamp
  end
end
