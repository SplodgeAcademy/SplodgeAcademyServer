class PopulateWritingWritingConversationsCount < ActiveRecord::Migration[8.0]
  def change
    Writing.all.each do |writing|
      Writing.reset_counters(writing.id, :writing_conversations)
    end
  end
end
