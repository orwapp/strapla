Then(/^I select "(.+)" as the technology I want the this application build in\.$/) do |title|
  select title
end

Given(/^I have completed the first part of the wizard$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the page where I can add new features$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I fill in the New feature form$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^this data to fill the background information form:$/) do |table|
  @table = table.raw
end

Then(/^I fill in all the mandatory fields with the necessary background information\.$/) do
  puts "Tabel: #{@table.first}"
  @table.each do |data|
    fill_in data.first, :with => data.last
  end
  click_button 'Save'
  page.should have_content 'Background information was successfully created.'
end

Given(/^We have the expert group named (.+)/) do |title| 
  Fabricate(:request_group, title: title)
  RequestGroup.last.title.should eq title
end
