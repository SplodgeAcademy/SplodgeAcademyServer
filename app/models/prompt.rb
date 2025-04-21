class Prompt < ApplicationRecord
    # Link problem to associated type
    has_one :essay
    has_one :review
    has_one :article
    has_one :report
end
