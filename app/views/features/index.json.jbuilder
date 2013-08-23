json.array!(@features) do |feature|
  json.extract! feature, :request_id, :text
  json.url feature_url(feature, format: :json)
end
