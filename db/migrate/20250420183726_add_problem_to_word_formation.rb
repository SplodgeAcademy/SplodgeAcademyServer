class AddProblemToWordFormation < ActiveRecord::Migration[8.0]
  def change
    add_reference :word_formations, :problem, null: false, foreign_key: true
  end
end
