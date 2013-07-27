require 'spec_helper'

describe PriceQuote do
  before do
    @price_quote = Fabricate(:price_quote)
  end
  specify { @price_quote.should be_valid }
end
