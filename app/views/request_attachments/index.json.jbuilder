json.array!(@request_attachments) do |request_attachment|
  json.extract! request_attachment, :id, :request_id, :image
  json.url request_attachment_url(request_attachment, format: :json)
end
