class AddProblemToSentenceTransformation < ActiveRecord::Migration[8.0]
  def change
    add_reference :sentence_transformations, :problem, null: false, foreign_key: true
  end
end
