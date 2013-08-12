Given(/^(?:I|we) have a user "([^\"]*)"(?: named "([^\"]*)" with password "([^\"]*)")?$/) do |email, name, password|
  unless User.find_by_email(email)
    name = name.split(' ')
    user = User.make :email => email, :first_name => name[0], :last_name => name[1], :password => password, :password_confirmation => password
    user.save!
  end
end

#Given(/^I am signed in as 'm@coderunner\.no'$/) do
Given(/^(?:I|we) have a user "([^\"]*)"(?: with password "([^\"]*)")?$/)do |email, password|
  unless User.find_by_email(email)
    user = Fabricate(:user, email: email, password: password, password_confirmation: password )
    user.save!
  end
end

Given(/^I am not signed in$/)do
  visit('/users/sign_out')
end

Given(/^I am signed out$/) do
  Given %{I am not signed in}
end

Given(/^I am signed in as "([^"]*)"$/) do |email|
  Given %{I am not signed in}
  Given %{I have a user "#{email}" with password "secret"}
  Given %{I am signed in as "#{email}" with password "secret"}
end


Given(/^We have an expert named Martin$/) do
  password = 'secret'
  unless User.find_by_email(email)
    name = name.split(' ')
    user = User.make :email => email, :first_name => name[0], :last_name => name[1], :password => password, :password_confirmation => password
    user.save!
  end
end

When(/^I go to the list of articles$/) do
    pending # express the regexp above with the code you wish you had
end

Given(/^I have a the expert "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Given(/^user "(.*?)" is named "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Given(/^I am on the home page$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I follow "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I fill in and submit the request form$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I press "(.*?)" within the invitation pop up box$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

When(/^I fill in "(.*?)" with "(.*?)" within the invitation pop up box$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Given(/^I am checking out many pages$/) do
    pending # express the regexp above with the code you wish you had
end
