json.array!(@price_quotes) do |price_quote|
  json.extract! price_quote, :user_id, :request_id, :price, :hours_estimated
  json.url price_quote_url(price_quote, format: :json)
end
