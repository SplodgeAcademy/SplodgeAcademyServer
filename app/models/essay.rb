class Essay < ApplicationRecord
    # Link Essay to Prompt
    belongs_to :prompt
end
