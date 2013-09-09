json.array!(@comments) do |comment|
  json.extract! comment, :text, :price_quote_id, :user_id
  json.url comment_url(comment, format: :json)
end
