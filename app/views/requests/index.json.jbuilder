json.array!(@requests) do |request|
  json.extract! request, :title, :description, :goal, :group_id
  json.url request_url(request, format: :json)
end
