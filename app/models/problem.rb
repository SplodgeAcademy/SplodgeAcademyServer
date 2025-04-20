class Problem < ApplicationRecord
    # Link problem to associated type
    has_one :multiple_choice
    has_one :open_cloze
    has_one :sentence_transformation
    has_one :word_formation
end
