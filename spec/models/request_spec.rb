require 'spec_helper'

describe Request do
  before :all do
    @user    = Fabricate(:user)
    @request = Fabricate(:request, user: @user)
  end
  it "is valid from the Fabric" do
    expect(Fabricate(:request)).to be_valid
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
    end

    context "Find Requests that we have accepted a price quote on " do
      before do
        @price_quote = Fabricate(:price_quote, request: @request, status: :accepted)
      end

      it "requests_with_price_quotes" do
        @dont_find_me = Fabricate(:request, user: @user)
        expect(@user.requests_with_price_quotes.first).to eq @request
      end
    end

  end
end
