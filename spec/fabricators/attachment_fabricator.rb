Fabricator(:attachment) do
  request { Fabricate(:request) }
  title      "MyString"
  image      "MyString"
end
