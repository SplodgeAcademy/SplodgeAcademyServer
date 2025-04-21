class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.text :situation
      t.text :task
      t.belongs_to :prompt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
