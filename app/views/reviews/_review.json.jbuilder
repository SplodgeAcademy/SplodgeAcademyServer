json.extract! review, :id, :title, :task, :prompt_id, :created_at, :updated_at
json.url review_url(review, format: :json)
