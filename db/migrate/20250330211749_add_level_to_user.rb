class AddLevelToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :level, :integer, default: 0
  end
end
