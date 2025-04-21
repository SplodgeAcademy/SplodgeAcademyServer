class Report < ApplicationRecord
    # Link Report to Prompt
    belongs_to :prompt
end
