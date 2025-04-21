class Writing < ApplicationRecord
    # Validate writing
    validates :body, presence: true

    # Link writing to User
    belongs_to :user

    # Link writing to Prompt
    belongs_to :prompt, counter_cache: true

    # Add rich text for body
    has_rich_text :body

    # Link to conversations and set to delete when writing destroyed
    has_many :writing_conversations, dependent: :destroy

    # Corrected State
    enum :state, [ :notCorrected, :corrected ]
end
