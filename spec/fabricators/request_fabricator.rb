Fabricator(:request) do
  title  { Faker::Lorem.sentence(5) }
  #title  "khk2"
  description "MyText"
  goal        "MyText"
  request_group  { Fabricate(:request_group) }
  published { true }
  contractor_id { nil }
end
