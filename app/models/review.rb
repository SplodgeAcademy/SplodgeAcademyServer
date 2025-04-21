class Review < ApplicationRecord
    # Link Review to Prompt
    belongs_to :prompt
end
