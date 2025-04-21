class CreateReadingQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :reading_questions do |t|
      t.string :question
      t.string :answer
      t.string :optionA
      t.string :optionB
      t.string :optionC
      t.string :optionD
      t.belongs_to :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
