class AddPromptTypeToPrompt < ActiveRecord::Migration[8.0]
  def change
    add_column :prompts, :prompt_type, :integer
  end
end
