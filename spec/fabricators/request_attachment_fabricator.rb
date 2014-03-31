Fabricator(:request_attachment) do
  request { Fabricate(:request) }
  image   "MyString"
end
