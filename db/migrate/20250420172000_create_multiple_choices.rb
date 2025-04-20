class CreateMultipleChoices < ActiveRecord::Migration[8.0]
  def change
    create_table :multiple_choices do |t|
      t.string :question
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.string :answer

      t.timestamps
    end
  end
end
