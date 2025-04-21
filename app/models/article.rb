class Article < ApplicationRecord
    # Link Article to Prompt
    belongs_to :prompt
end
