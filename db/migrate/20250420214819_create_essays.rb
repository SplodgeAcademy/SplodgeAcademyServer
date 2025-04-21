class CreateEssays < ActiveRecord::Migration[8.0]
  def change
    create_table :essays do |t|
      t.text :situation
      t.text :task
      t.string :note1
      t.string :note2
      t.belongs_to :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
