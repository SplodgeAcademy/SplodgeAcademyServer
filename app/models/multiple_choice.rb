class MultipleChoice < ApplicationRecord
    # Link Multiple Choice to Problem
    belongs_to :problem
end
