json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :request_id, :title, :image
  json.url attachment_url(attachment, format: :json)
end
