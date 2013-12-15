Fabricator(:comment) do
  text        "MyText"
  price_quote { Fabricate(:price_quote) }
  user        { Fabricate(:user) }
end
