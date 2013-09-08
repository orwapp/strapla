Given(/^I am signed in$/) do
  email = 'testing@man.net'
  password = 'secretpass'
  Fabricate(:user, email: email, password: password, password_confirmation: password)

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Given(/^We have one expert user in our database$/) do
  Fabricate(:user)
end

When(/^I go to the frontpage$/) do
  visit '/'
end



Given(/^I am on the home page$/) do
  visit('/')
end

When(/^I (?:follow|click|press) "(.*?)"$/) do |name|
  click_on name
end

When(/^I go to the home page$/) do
  visit('/')
end


Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, data|
  fill_in field, with: data
end

Then(/^(?:he|I|she) should see "(.*?)"$/) do |text|
  page.should have_content(text)
end
