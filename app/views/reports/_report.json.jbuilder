json.extract! report, :id, :situation, :task, :prompt_id, :created_at, :updated_at
json.url report_url(report, format: :json)
