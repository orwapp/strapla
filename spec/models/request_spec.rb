require 'spec_helper'

describe Request do
  before :each do
    @user    = Fabricate(:user)
    @request = Fabricate(:request, user: @user)
  end
  
  it "is valid from the Fabric" do
    expect(@request).to be_valid
  end

  describe "Queries" do

    context "Find Requests sent to group or expert, but has not received any quotes" do
      it "awaiting_response" do
        @user.requests_awaiting_response.first.should eq @request
      end
    end

    context "Find Requests that has received price quotes" do
      before do
        @price_quote = Fabricate(:price_quote, request: @request)
      end

      it "requests_with_price_quotes" do
        @dont_find_me = Fabricate(:request, user: @user)
        expect(@user.requests_with_price_quotes.first).to eq @request
      end

      it "the other selectors should not find anything here" do
        expect(@user.requests_awaiting_response.first).to_not be(@request)
        expect(@user.requests_with_accepted_quotes.first).to_not be(@request)
      end
    end

    context "Find Requests that we have ACCEPTED a price quote on " do
      before do
        @price_quote = Fabricate(:price_quote, request: @request)
        @price_quote.status = 'accepted'
        @price_quote.save
      end

      it "requests_with_accepted_quotes" do
        @dont_find_me = Fabricate(:request, user: @user, status: :rejected)
        expect(@user.requests_with_accepted_quotes).to include(@request)
      end

      context "the other selectors should not find anything here" do
        it "requests_awaiting_response" do
          expect(@user.requests_awaiting_response).to_not include(@request)
        end

        it "requests_with_price_quotes" do
          expect(@user.requests_with_price_quotes).to_not include(@request)
        end
      end
    end

  end
end
