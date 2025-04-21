class PopulatePromptWritingsCount < ActiveRecord::Migration[8.0]
  def change
    Prompt.all.each do |prompt|
      Prompt.reset_counters(prompt.id, :writings)
    end
  end
end
