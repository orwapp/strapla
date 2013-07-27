Fabricator(:request) do
  subject     "MyString"
  description "MyText"
  goal        "MyText"
  request_group  { Fabricate(:request_group) }
end
