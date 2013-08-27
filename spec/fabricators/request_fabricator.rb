Fabricator(:request) do
  title     "MyString"
  description "MyText"
  goal        "MyText"
  request_group  { Fabricate(:request_group) }
end
