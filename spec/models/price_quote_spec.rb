require 'spec_helper'

describe PriceQuote do
  before do
    @price_quote = Fabricate(:price_quote, user: Fabricate(:user))
  end
  specify { @price_quote.should be_valid }

  it "has an owner and an expert" do
    @expert = Fabricate(:user)
    @price_quote.request.contractor = @expert
  end
end
