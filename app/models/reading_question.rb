class ReadingQuestion < ApplicationRecord
    # Link Question to associated reading
    belongs_to :reading
end
