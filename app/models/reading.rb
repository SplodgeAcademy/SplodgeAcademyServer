class Reading < ApplicationRecord
    # Link reading to associated type
    has_one :text_choice
    has_one :text_missing
    has_one :text_matching

    has_many :reading_questions
end
