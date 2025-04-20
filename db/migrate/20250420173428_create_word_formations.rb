class CreateWordFormations < ActiveRecord::Migration[8.0]
  def change
    create_table :word_formations do |t|
      t.string :question
      t.string :answer
      t.string :keyword

      t.timestamps
    end
  end
end
