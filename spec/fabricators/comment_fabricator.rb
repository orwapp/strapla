Fabricator(:comment) do
  text        "MyText"
  price_quote nil
  user  { Fabricate(:user) }
  price_quote { Fabricate(:price_quote) }
end
