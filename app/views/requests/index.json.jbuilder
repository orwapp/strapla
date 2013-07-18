json.array!(@requests) do |request|
  json.extract! request, :subject, :description, :goal, :group_id
  json.url request_url(request, format: :json)
end
