class CreateSentenceTransformations < ActiveRecord::Migration[8.0]
  def change
    create_table :sentence_transformations do |t|
      t.string :question
      t.string :prompt
      t.string :answer
      t.string :keyword

      t.timestamps
    end
  end
end
