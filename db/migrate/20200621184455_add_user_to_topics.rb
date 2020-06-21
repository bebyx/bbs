class AddUserToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :user, :string
  end
end
