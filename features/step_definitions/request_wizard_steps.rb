Then(/^I select "(.+)" as the technology I want the this application build in\.$/) do |title|
  page.select(title, :from => 'request_request_group_id')
end

Given(/^I have completed the first part of the wizard$/) do
  steps %{
    When I go to the frontpage
    Then I press Get someone to help you
    When I press Build something new
    Then I should be on the page where I provide background information
    And I select "Ruby on Rails" as the technology I want the this application build in.
    And I fill in all the mandatory fields with the necessary background information.
    And I press Save
  }
  @background_information = BackgroundInformation.last
  @background_information.should be_valid
  @request = Request.last
end

Given(/^I am on the page where I can add new features$/) do
  current_path.should eq new_request_feature_path(@request)
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I fill in the New feature form$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^this data to fill the background information form:$/) do |table|
  @table = table.raw
end

Then(/^I fill in all the mandatory fields with the necessary background information\.$/) do
  @table.each do |data|
    fill_in data.first, :with => data.last
  end
end

Given(/^We have the expert group named (.+)/) do |title| 
  Fabricate(:request_group, title: title)
  RequestGroup.last.title.should eq title
end

Then(/^I should be on the page where I provide background information$/) do
  current_path.should eq new_background_information_path
end
