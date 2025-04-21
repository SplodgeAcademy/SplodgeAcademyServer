class RemoveTitleFromWritings < ActiveRecord::Migration[8.0]
  def change
    remove_column :writings, :title
  end
end
