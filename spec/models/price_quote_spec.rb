require 'spec_helper'

describe PriceQuote do
  before do
    @request_owner = Fabricate(:user)
    @request       = Fabricate(:request, user: @request_owner)
    @price_quote   = Fabricate(:price_quote, user: Fabricate(:user), request: @request, status: nil)
    @accepted_price_quote   = Fabricate(:price_quote, user: Fabricate(:user), request: @request, status: :accepted)
  end
  specify { @price_quote.should be_valid }


  it "Returns unprocessed price quotes made on a user's Request" do
    PriceQuote.unprocessed_belonging_to_user(@request_owner).should     include @price_quote
  end

  it "should not return quotes that has been accepted" do
    PriceQuote.unprocessed_belonging_to_user(@request_owner).should_not include @accepted_price_quote
  end

  describe "accepted_belonging_to_user" do
    it "Return all accepted price quotes" do
      PriceQuote.accepted_belonging_to_user(@request_owner).should include @accepted_price_quote
    end
  end

end
