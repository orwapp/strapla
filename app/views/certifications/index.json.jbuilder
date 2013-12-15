json.array!(@certifications) do |certification|
  json.extract! certification, :user_id, :title, :date
  json.url certification_url(certification, format: :json)
end
