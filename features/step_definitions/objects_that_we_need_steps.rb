Given(/^We have the expert group named (.+)/) do |title| 
  Fabricate(:request_group, title: title)
  RequestGroup.last.title.should eq title
end


Given(/^We have one expert user in our database, named (.+)/) do |name|
  Fabricate(:user, name: name)
end

Given(/^"(.*?)" has the name "(.*?)"$/) do |email, name|
  user = User.find_by_email(email)
  user.update_attribute(:name, name)
end

Given(/^"(.*?)" has posted a request titled "(.*?)" in the "(.*?)" group$/) do |user_email, title, group_name|
  user    = Fabricate(:user, email: user_email)
  group   = Fabricate(:request_group, title: group_name)
  @request = Fabricate(:request, user: user, title: title, request_group: group)
  @request.should be_valid
end

Given(/^"(.*?)" has posted a request titled "(.*?)" delegated to "(.*?)"$/) do |customer_email, title, expert_email|
  @customer = Fabricate(:user, email: customer_email)
  @expert   = Fabricate(:user, email: expert_email)
  @request = Fabricate(:request, user: customer, delegated_to_user_id: expert.id)

  @customer.should be_valid
  @expert.should be_valid
  @request.should be_valid
end


Given(/^We have the expert "(.*?)" named "(.*?)"$/) do |email, name|
  Fabricate(:user, name: name, email: email)
end
