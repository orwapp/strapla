require 'spec_helper'

describe Comment do
  before do
    @comment = Fabricate(:comment)
  end
  specify { @comment.should be_valid }

  it "belongs to a Price Quote" do
    @comment.price_quote.should      be_kind_of PriceQuote
    @comment.price_quote.user.should be_kind_of User
  end
end
