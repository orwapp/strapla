require 'spec_helper'

describe Comment, focus: true do
  before do
    @request_owner = Fabricate(:user)
    @expert        = Fabricate(:user)
    @price_quote   = Fabricate(:price_quote, user: @expert)
    @comment       = Fabricate(:comment)
    @comment.update_attribute(:commentable, @price_quote)
  end
  specify { @comment.should be_valid }


  pending "When creating new comments" do
    let(:request_owner) { Fabricate(:user, email: 'request@owner.com') }
    let(:expert)        { Fabricate(:user, email: 'expert@user.com') }
    let(:request)       { Fabricate(:request, user: expert) }
    let(:price_quote)   { Fabricate(:price_quote, user: expert, 
                                    request: request) }
    let(:comment)       { Fabricate(:comment, price_quote: price_quote, 
                                   user: expert) }


    it "Sends an email to the request owner when the expert comments on a 
        price quote" do
      ActionMailer::Base.deliveries.last.to.should include(request_owner.email)
      mail.subject.should eq("New comment")
      #mail.to.should eq([request_owner.email])
      #mail.from.should eq(["system@coderunner.co"])
      #mail.body.encoded.should match((request_url(request)))
    end

    it "Sends an email to the expert when the request owner comments on a price quote" do
    end
  end
end
