require 'spec_helper'

describe Comment do
  #before do
  #  @request_owner = Fabricate(:user)
  #  @expert        = Fabricate(:user)
  #  @price_quote   = Fabricate(:price_quote, user: @expert)
  #  @comment = Fabricate(:comment, price_quote: @price_quote)
  #end
  #specify { @comment.should be_valid }

  #it "belongs to a Price Quote" do
  #  @comment.price_quote.should      be_kind_of PriceQuote
  #  @comment.price_quote.user.should be_kind_of User
  #end

  describe "When creating new comments" do
    let(:request_owner) { Fabricate(:user) }
    let(:expert)        { Fabricate(:user) }
    let(:request)       { Fabricate(:request, user: expert) }
    let(:price_quote)   { Fabricate(:price_quote, user: expert, request: request) }
    let(:comment)       { Fabricate(:comment, price_quote: price_quote) }

    it "Sends an email to the request owner when the expert comments on a price quote" do
      pending
      ActionMailer::Base.deliveries.last.to.should include(request_owner.email)
      #mail.subject.should eq("New comment")
      #mail.to.should eq([request_owner.email])
      #mail.from.should eq(["system@coderunner.co"])
      #mail.body.encoded.should match((request_url(request)))
    end

    it "Sends an email to the expert when the request owner comments on a price quote" do
    end
  end
end
