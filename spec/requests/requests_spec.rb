require 'spec_helper'
include LoginHelper
include IntegrationHelpers

describe "Create a new request" do
  before(:all) do
    @request_group = RequestGroup.create(title: 'iOS')
    @user   = Fabricate(:user)
    @expert = Fabricate(:user, name: 'Richard Stallman')
    @expert.request_groups << @request_group
  end


  describe "It can be delegated to.." do
    it "a single expert" do
      sign_in(@user)
      visit new_request_path
      fill_in_request_form(group: 'iOS') 
      
      # We are now on the select recipient page
      click_button 'Send the question to Richard'

      page.should have_content('Richard Stallman will contact you shortly.')

      r = Request.last
      r.request_group.title.should eq 'iOS'
      r.user.should eq @user
      r.contractor.should eq @expert
      Request.unassigned.first.should_not eq r
    end


    it "a group" do
      sign_in(@user)
      visit new_request_path
      fill_in_request_form(group: 'iOS') 
      
      # We are now on the select recipient page
      click_button 'Send the question to the iOS group'

      page.should have_content('The request has been forwarded to our expert group')

      r = Request.last
      r.request_group.title.should eq 'iOS'
      r.user.should eq @user
      r.contractor.should eq nil
      Request.unassigned.first.should eq r
    end
  end

  describe "new undelegated requests " do
    before do
      @request = Fabricate(:request, subject: 'My new request')
      @request.should be_valid
    end

    it "should be visible under 'Unassigned Requests'" do
      sign_in(@user)
      visit requests_path
      page.should have_content('My new request')
    end
  end

  describe "new delegated requests " do
    pending
    before do
      @request = Fabricate(:request, subject: 'Special task for Martin')
      @request.should be_valid
    end

    it "should be visible under 'My Request'" do
      sign_in(@user)
      visit my_requests_path
      page.should have_content('Special task for Martin')
    end

  describe "if the expert rejects a new request"
    before do
      @request = Fabricate(:request, subject: 'Special task for Martin')
    end

    it "should be forwarded to the RequestGroup so that a new expert can have it" do
      pending

    end
  end

end
