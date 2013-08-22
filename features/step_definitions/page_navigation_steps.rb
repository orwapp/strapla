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

Then(/^I press Get someone to help you$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I press Build something new$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the page where I provide background information$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I fill in all the mandatory fields with the necessary background information\.$/) do
  pending # express the regexp above with the code you wish you had
end
