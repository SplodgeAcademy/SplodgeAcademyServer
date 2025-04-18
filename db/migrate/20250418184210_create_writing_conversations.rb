class CreateWritingConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :writing_conversations do |t|
      t.belongs_to :writing, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
