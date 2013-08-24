json.array!(@features) do |feature|
  json.extract! feature, :request_id, :text, :title
  json.url feature_url(feature, format: :json)
end
