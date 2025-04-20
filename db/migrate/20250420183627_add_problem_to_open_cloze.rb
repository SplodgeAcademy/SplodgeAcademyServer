class AddProblemToOpenCloze < ActiveRecord::Migration[8.0]
  def change
    add_reference :open_clozes, :problem, null: false, foreign_key: true
  end
end
