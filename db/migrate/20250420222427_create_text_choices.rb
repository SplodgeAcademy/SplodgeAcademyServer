class CreateTextChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :text_choices do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
