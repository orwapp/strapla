require 'spec_helper'
include LoginHelper
include IntegrationHelpers

describe "PriceQuotes" do
  before do
    @request_group = RequestGroup.create(title: 'iOS')
    @request_owner = Fabricate(:user)
    @expert = Fabricate(:user, name: 'Richard Stallman')
    @expert.request_groups << @request_group
    @request = Fabricate(:request, request_group: @request_group, subject: 'Please help me', user: @request_owner)
  end


  describe "An expert can send price quotes on requests" do
    before do
      sign_in(@expert)
      visit root_url
      click_link 'Unassigned request' 
      page.should have_content 'Please help me'
      click_link 'Show'
      click_link 'Quote a price'
      fill_in 'Comment', :with => 'I can do it'
      fill_in 'Price', :with => '3'
      fill_in 'Hours estimated', :with => '3'
      click_button 'Send'
      page.should have_content 'Price quote sent to client'
    end

    it "should send an email to the owner of the request" do
      last_email.to.should include(@request_owner.email)
    end

    it "the email should contain a link to where the request_owner can accept or reject the price quote" do
      last_email.body.should match 'Click here'
    end
  end

  describe "respond to a price quote" do
    before do
      @price_quote = Fabricate(:price_quote, request: @request, user: @expert)
      sign_in(@request_owner)
      visit request_price_quote_path(@price_quote.request, @price_quote)
    end

    describe "Sends an email to the owner of the request and the guy who created the price quote" do
      it "When accepted" do
        click_link 'Accept'
        page.should have_content 'Price quote accepted'
        last_email.body.raw_source.should include request_price_quote_path(@price_quote, @price_quote.request)
        PriceQuote.last.status.should eq 'accepted'
        recipients = ActionMailer::Base.deliveries.collect(&:to).flatten
        recipients += ActionMailer::Base.deliveries.collect(&:cc).flatten
        recipients.should eq [@request_owner.email, @expert.email]
      end

      it "When rejected" do
        pending
        click_link 'Reject'
        PriceQuote.last.status.should eq 'rejected'
      end

    end

  end
end
