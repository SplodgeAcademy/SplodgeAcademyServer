class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :task
      t.belongs_to :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
