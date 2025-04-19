class RemoveBodyFromWriting < ActiveRecord::Migration[8.0]
  def change
    remove_column :writings, :body, :text
  end
end
