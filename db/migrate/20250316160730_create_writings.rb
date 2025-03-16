class CreateWritings < ActiveRecord::Migration[8.0]
  def change
    create_table :writings do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
