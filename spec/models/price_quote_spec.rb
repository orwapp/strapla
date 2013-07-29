require 'spec_helper'

describe PriceQuote do
  pending do
    before do
      @price_quote = Fabricate(:price_quote, user: Fabricate(:user))
    end
    specify { @price_quote.should be_valid }
  end
end
