json.extract! text_choice, :id, :title, :subtitle, :body, :reading_id, :created_at, :updated_at
json.url text_choice_url(text_choice, format: :json)
