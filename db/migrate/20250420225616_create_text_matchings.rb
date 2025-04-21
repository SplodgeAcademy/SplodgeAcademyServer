class CreateTextMatchings < ActiveRecord::Migration[8.0]
  def change
    create_table :text_matchings do |t|
      t.string :title
      t.text :para1
      t.text :para2
      t.text :para3
      t.text :para4
      t.string :sub1
      t.string :sub2
      t.string :sub3
      t.string :sub4
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
