class AddSageToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :sage, :boolean
  end
end
