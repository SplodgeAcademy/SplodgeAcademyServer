json.extract! text_matching, :id, :title, :para1, :para2, :para3, :para4, :sub1, :sub2, :sub3, :sub4, :reading_id, :created_at, :updated_at
json.url text_matching_url(text_matching, format: :json)
