class Prompt < ApplicationRecord
    # Link prompt to associated type
    has_one :essay
    has_one :review
    has_one :article
    has_one :report

    # Link Prompt to associated writings
    has_many :writings

    # Prompt Type
    enum :prompt_type, [ :essayType, :articleType, :reviewType, :reportType ]
end
