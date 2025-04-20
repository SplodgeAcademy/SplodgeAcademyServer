class WritingConversation < ApplicationRecord
    # Link Conversation to Writing and User
    belongs_to :writing, counter_cache: true
    belongs_to :user

    # Add rich text for body
    has_rich_text :body
end
