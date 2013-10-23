Then(/^I select "(.+)" as the technology I want the this application build in\.$/) do |title|
  page.select(title, :from => 'request_request_group_id')
end

Given(/^I have completed the first part of the wizard$/) do
  steps %{
    When I go to the frontpage
    Then I press "Start your project"
		Then I fill in "Title" with "lkjlkj"
		Then I fill in "Goal" with "lkjlkj"
		Then I fill in "Description" with "lkjlkj"
    When I press "Next"
    When I press "Continue"
    When I press "Continue"
    When I press "Continue"
    And I select "Ruby on Rails" as the technology I want the this application build in.
    When I press "Continue"
    Then we should have one Request object saved
  }
  @request = Request.last
  @request.request_group.should be_valid
  @request.should be_valid
end

Given(/^I am on the page where I can add new features$/) do
  current_path.should eq new_request_feature_path(@request)
end


Given(/^this data to fill the background information form:$/) do |table|
  @table = table.raw
end

Then(/^I fill in all the mandatory fields with the necessary background information\.$/) do
  @table.each do |data|
    fill_in data.first, :with => data.last
  end
end

Then(/^I fill in and submit the first New feature form$/) do
  fill_in 'Title', with: 'Post requests for help'
  fill_in 'Text', with: 'Post requests for help'
  click_on 'Add'
  click_on 'Save'
end

Then(/^I fill in and submit the second New feature form$/) do
  fill_in 'Title', with: 'Post requests for help'
  fill_in 'Text', with: 'Post requests for help'
  click_on 'Add'
  click_on 'Save'
end

Given(/^I have created two features and pressed Next$/) do
  Feature.all.size.should eq 2
end

Then(/^we should have a new request available for consultants to give a price quote on\.$/) do
  Request.last.should be_valid
  Request.last.title.should eq 'Build something nice'
end


Then(/^I should have (\d+) features stored in the database$/) do |n|
  Feature.all.size.should eq n.to_i
end


Then(/^we should have one Request object saved$/) do
  Request.all.size.should eq 1
end


Then(/^I select "(.*?)" as the group$/) do |arg1|
  select arg1
end


Given(/^I have created two features$/) do
  steps %{
    Given I have completed the first part of the wizard
    Then I should see "Describe which features you want"
    Then I fill in and submit the first New feature form
    And I fill in and submit the second New feature form
    When I press "Next"
    Then I should have 2 features stored in the database
  }
end



Then(/^"(.*?)" should be notified that I have sent a price quote$/) do |email|
  last_email.to.should include(email)
end

Given(/^"(.*?)" has sent a price quote to the request owner "(.*?)"/) do |expert_email, owner_email|
  @expert   = Fabricate(:user, email: expert_email)
  @price_quote = Fabricate(:price_quote, user: @expert, request: @request)
  @request.valid? == true
  @price_quote.notify_owner_about_new_quote
end

When(/^"(.*?)" opens his email and clicks "(.*?)"$/) do |arg1, email|
  last_email.content.should include(request_price_quote_url(@request, @price_quote))
end

Then(/^he should be one the request show page$/) do
  current_path.should eq request_price_quote(@request, @price_quote)
end


Then(/^the request titled "(.*)" should be marked as delegated to "(.*?)"$/) do |title, email|
  @request = Request.find_by_title(title)
  @request.contractor.should eq User.find_by_email(email)
end

Then(/^"(.*?)" should be on the price quote page$/) do |email|
	@user				 = User.find_by_email email
	@price_quote = @user.price_quotes.last
	current_path.should eq request_path(@price_quote)
end

Then(/^the "(.*?)" group should have one new unassigned request$/) do |group|
  @group = RequstGroup.find_by_name(group)
  @group.requests.size.should eq 1
end
