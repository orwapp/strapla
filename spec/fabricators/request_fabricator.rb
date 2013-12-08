Fabricator(:request) do
  title  { Faker::Lorem.sentence(5) }
	##user	 { Fabricate(:user) }
  #description "MyText"
  #goal        "MyText"
  ##request_group  { Fabricate(:request_group) }
  #published { true }
  #contractor_id { nil }
end
