class AddWritingConversationCounterCacheToWritings < ActiveRecord::Migration[8.0]
  def change
    add_column :writings, :writing_conversations_count, :integer
  end
end
