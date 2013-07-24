require 'spec_helper'
include LoginHelper

describe "Create a new request" do
  before do
    @request_group = RequestGroup.create(title: 'iOS')
    @user = Fabricate(:user)
    @user.should be_valid
  end

  it "Sign in first" do
  end

  it "Click the new request button on the front page" do
    sign_in(@user)
    visit root_path
    Request.all.size.should eq 0
    click_link 'Find someone to help you'

    fill_in :request_subject, with: 'Need help with getting the Facebook API working'
    fill_in :request_goal,    with: 'Should post msg to facebook'
    fill_in :request_description,    with: 'Oklkj'
    page.select('iOS', :from => 'request_request_group_id')

    click_button 'Next'

    # We are now on the select recipient page
    current_path.should eq(select_recipient_path(Request.last))
    
    click_button 'Send the question to the iOS group'
    page.should have_content('The request has been forwarded to our expert group')
    Request.all.size.should eq 1

  end
end
