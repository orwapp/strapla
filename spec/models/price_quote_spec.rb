require 'spec_helper'

describe PriceQuote do
  before :each do
    @request_owner        = Fabricate(:user)
    @price_quote_owner    = Fabricate(:user)
    @request              = Fabricate(:request, user: @request_owner)
    @price_quote          = Fabricate(:price_quote, user: @price_quote_owner, 
                                      request: @request, status: nil)
    @accepted_price_quote = Fabricate(:price_quote, user: Fabricate(:user), 
                                      request: @request, status: 'accepted')
    @rejected_price_quote = Fabricate(:price_quote, user: Fabricate(:user), 
                                      status: 'rejected')
  end
  specify { @price_quote.should be_valid }
  specify { @accepted_price_quote.should be_valid }

  describe "Comments", focus: true do
    it "can have comments" do
      comment = Comment.create(body: 'hi')
      comment.update_attribute(:commentable, @price_quote)
      @price_quote.reload
      @price_quote.comments.first.body.should eq 'hi'
    end
  end

  describe "Queries" do
    describe "accepted" do
      it "Return all accepted price quotes on the requests owned by 
        Request Owner" do
        PriceQuote.accepted_belonging_to_request_owner(@request_owner).should 
          include @accepted_price_quote
      end

      it "Updates the Request it belongs to´s status" do
        expect(@request.status).to eq 'accepted'
      end
    end


    context "Find price quotes created by the user that is " do
      @price_quote_owner       = Fabricate(:user)
      @accepted_price_quote    = Fabricate(:price_quote, user: @price_quote_owner, status: 'accepted')
      @rejected_price_quote    = Fabricate(:price_quote, user: @price_quote_owner, status: 'rejected')
      @unprocessed_price_quote = Fabricate(:price_quote, user: @price_quote_owner, status: nil)

      it "unprocessed" do
      pending 
        expect(@price_quote_owner.price_quotes.unprocessed.to_a).to include @unprocessed_price_quote
      end

      it "accepted" do
      pending 
        expect(@price_quote_owner.price_quotes.accepted.to_a).to include @accepted_price_quote
      end

      it "rejected" do
      pending 
        expect(@price_quote_owner.price_quotes.rejected.to_a).to include @rejected_price_quote
      end

    end
  end


end
