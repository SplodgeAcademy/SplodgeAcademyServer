class Writing < ApplicationRecord
    # Validate writing
    validates :title, presence: true
    validates :body, presence: true

    # Link writings to User
    belongs_to :user

    # Link to conversations and set to delete when writing destroyed
    has_many :writing_conversations, dependent: :destroy

    # Allowing attributes to be searched by ransack
    def self.ransackable_attributes(auth_object = nil)
        [ "body", "title" ]
    end

    def self.ransackable_associations(auth_object = nil)
        [ "user" ]
    end
end
