class CreateOpenClozes < ActiveRecord::Migration[8.0]
  def change
    create_table :open_clozes do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
