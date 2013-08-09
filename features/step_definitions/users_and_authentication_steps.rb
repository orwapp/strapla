Given /^(?:I|we) have a user "([^\"]*)"(?: named "([^\"]*)" with password "([^\"]*)")?$/ do |email, name, password|
  unless User.find_by_email(email)
    name = name.split(' ')
    user = User.make :email => email, :first_name => name[0], :last_name => name[1], :password => password, :password_confirmation => password
    user.save!
  end
end

Given /^(?:I|we) have a user "([^\"]*)"(?: with password "([^\"]*)")?$/ do |email, password|
  unless User.find_by_email(email)
    user = Fabricate(:user, email: email, password: password, password_confirmation: password )
    user.save!
  end
end

Given(/^I am signed in as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I go to the home page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should not see "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end
