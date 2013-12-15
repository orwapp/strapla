Given(/^I am signed in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Fabricate(:user, email: email, password: password, password_confirmation: password)

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Given(/^we have one expert user in our database$/) do
  Fabricate(:user)
end

When(/^(?:he|I|she) go to the frontpage$/) do
  visit '/'
end



Given(/^(?:he|I|she) am on the home page$/) do
  visit('/')
end

When(/^(?:he|I|she) (?:follow|click|press) "(.*?)"$/) do |name|
  click_on name
end

When(/^(?:he|I|she) go to the home page$/) do
  visit('/')
end


Then(/^(?:he|I|she) fill in "(.*?)" with "(.*?)"$/) do |field, data|
  fill_in field, with: data
end

Then(/^(?:he|I|she) should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^(?:he|I|she) should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Then(/^I should be on the page where I can negotiate terms with the developer$/) do
  #current_path.should eq request_price_quote(
end

Then(/^show me the page$/) do
	save_and_open_page
end
