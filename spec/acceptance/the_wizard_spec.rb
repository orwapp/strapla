require 'acceptance/acceptance_helper'

feature 'The wizard', %q{
  In order to post a new request
  As a user
  I want a wizard to guide me through
} do

  background do
    @user = Fabricate :user
    #RequestGroup.create(title: 'Desktop application - Windows')
    #RequestGroup.create(title: 'Desktop application - Mac')
    #RequestGroup.create(title: 'Android app')
    #RequestGroup.create(title: 'iOS app')
    #RequestGroup.create(title: 'Integration')
    RequestGroup.create(title: 'Linux / UNIX scripting')
    RequestGroup.create(title: 'Web application')
  end

  scenario 'Log in and start a new project' do
    visit '/'
    click_link "Start your project"
    fill_in_credentials_on_sign_in_form
    current_path.should eq init_request_path
    click_link 'Build something new'  
    fill_in 'request_title', with: 'her er tittel'
    fill_in 'request_description',  with: 'her er desc'
    fill_in 'request_background_information', with: 'her er tittel'
    click_button 'Save'
    page.should have_content 'Upload images and sketches of the app'
    click_link 'Continue'

    # kind of software
    page.should have_content 'Please select what kind of project this is'
    click_link 'Web application'
    click_button 'Continue'
      
  end

end

def fill_in_credentials_on_sign_in_form
  current_path.should eq new_user_session_path
                                                
  fill_in 'user_email',    with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'Sign in'
end
