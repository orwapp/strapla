Transform /^user "([^\"]*)"$/ do |email|
  User.find_by_email(email)
end

Given /^I am not signed in$/ do
  visit('/users/sign_out')
end

Given /^I am signed out$/ do
  Given %{I am not signed in}
end

Given /^(?:I|we) have a user "([^\"]*)"(?: named "([^\"]*)" with password "([^\"]*)")?$/ do |email, name, password|
  unless User.find_by_email(email)
    name = name.split(' ')
    user = User.make :email => email, :first_name => name[0], :last_name => name[1], :password => password, :password_confirmation => password
    user.skip_confirmation!
    user.save!
  end
end

Given /^(?:I|we) have a user "([^\"]*)"(?: with password "([^\"]*)")?$/ do |email, password|
  unless User.find_by_email(email)
    user = User.make :email => email, :password => password, :password_confirmation => password
    user.skip_confirmation!
    user.save!
  end
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  Given %{I am not signed in}
  Given %{I have a user "#{email}" with password "secret"}
  Given %{I am signed in as "#{email}" with password "secret"}
end

Given /^(user "(?:.+)") is an administrator$/ do |user|
  user.assign_role(:administrator)
  user.save!
  CONFIG['emails']['administrators'] << user.email
  CONFIG['emails']['administrators'].uniq!
end

Given /^(user "(?:.+)") is not an administrator$/ do |user|
  user.revoke_role(:administrator)
  user.save!
end

Given /^(user "(?:.+)") is named "([^"]*)"$/ do |user, name|
  name = name.split(' ')
  user.first_name = name.shift
  user.last_name = name.join(" ")
  user.save!
end

Given /^I am signed in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Given %{I am not signed in}

  token_id = "abc"
  user     = User.find_by_email(email)

  SetUserFromAuthApiSignInToken.should_receive(:process).with(token_id).and_return(user)
  
  visit users_sign_in_from_auth_app_path(:token_id => token_id)

  @current_user = user
end

Given /^my account has an unconfirmed extra email "([^"]*)"$/ do |email|
  @current_user.add_extra_email(email)
  @current_user.save!
end

Given /^my account has a confirmed extra email "([^"]*)"$/ do |email|
  email = @current_user.add_extra_email(email)
  email.confirm!(email.confirmation_token)
end

Given /^(user "(?:.+)") has a confirmed extra email "([^"]*)"$/ do |user, email|
  email = user.add_extra_email(email)
  email.confirm!
end

Then /^"([^"]*)" should be listed as an unconfirmed email$/ do |email|
  Then %{I should see "#{email}" within "#emails .unconfirmed"}
end

Then /^"([^"]*)" should be listed as a confirmed email$/ do |email|
  Then %{I should see "#{email}" within "#emails .confirmed"}
end

Then /^"([^"]*)" should not be listed as an email$/ do |email|
  Then %{I should not see "#{email}" within "#emails"}
end

Then /^"([^"]*)" should be listed as my main email$/ do |email|
  Then %{I should see "#{email}" within "#emails .main"}
end

Then /^my account should have a picture$/ do
  @current_user.reload
  @current_user.avatar.should be_present
end

Then /^my account should have not a picture$/ do
  @current_user.reload
  @current_user.avatar.should_not be_present
end


Given /^"([^"]*)" has signed up$/ do |email|
  visit new_user_registration_path

  within "form#user_new" do
    fill_in "First name", with: "Thorbjorn"
    fill_in "Last name", with: "Hermansen"
    fill_in "Your email", with: email
    fill_in "Password", with: "secret"
    click_button "Sign up"
  end
end

When /^I ask Companybook to resend my confirmation email to "([^"]*)"$/ do |email|
  visit new_user_confirmation_path

  within "form#user_new" do
    fill_in "E-mail", with: email
    click_button "Resend confirmation instructions"
  end
end
