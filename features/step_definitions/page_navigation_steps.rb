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

Then(/^I press (.*)$/) do |link| 
  click_on link
end

