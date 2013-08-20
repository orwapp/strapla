json.array!(@feature_requests) do |feature_request|
  json.extract! feature_request, :user_id, :user_story, :request_id
  json.url feature_request_url(feature_request, format: :json)
end
