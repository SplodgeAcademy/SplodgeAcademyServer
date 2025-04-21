class CreateTextMissings < ActiveRecord::Migration[8.0]
  def change
    create_table :text_missings do |t|
      t.string :title
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.string :optionE
      t.string :optionF
      t.string :optionG
      t.text :body
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
