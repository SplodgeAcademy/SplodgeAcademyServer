class Writing < ApplicationRecord
    # Validate writing
    validates :title, presence: true
    validates :body, presence: true

    # Link writings to User
    belongs_to :user

    # Link to conversations and set to delete when writing destroyed
    has_many :writing_conversations, dependent: :destroy
end
