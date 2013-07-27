require 'spec_helper'
include LoginHelper
include IntegrationHelpers

describe "Create a new request" do
  before do
    @request_group = RequestGroup.create(title: 'iOS')
    @user = Fabricate(:user)
    @expert = Fabricate(:user, name: 'Richard Stallman')
    @expert.request_groups << @request_group
    @expert.should be_valid
  end


  describe "Click the new request button on the front page" do
    before do
      sign_in(@user)
      visit root_path
      Request.all.size.should eq 0
      click_link 'Find someone to help you'
      fill_in_request_form(group: 'iOS') 
      # We are now on the select recipient page
      click_button 'Send the question to the iOS group'
      page.should have_content('The request has been forwarded to our expert group')
    end
    it "creates a new request" do
      Request.all.size.should eq 1
    end
  end

  it "test that a single expert can be delegate a request" do
    sign_in(@user)
    visit new_request_path
    fill_in_request_form(group: 'iOS') 
    
    # We are now on the select recipient page
    click_button 'Send the question to the iOS group'

    page.should have_content('The request has been forwarded to our expert group')

    r = Request.last
    r.request_group.title.should eq 'iOS'
    r.user.should eq @user
    Request.unassigned.first.should eq r
  end



end
