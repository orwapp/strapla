json.array!(@request_groups) do |request_group|
  json.extract! request_group, :title, :description
  json.url request_group_url(request_group, format: :json)
end
