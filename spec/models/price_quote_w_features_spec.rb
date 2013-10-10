require 'spec_helper'

describe PriceQuote do
    before do
      @request_owner = Fabricate(:user)
      @request = Fabricate(:request, user: @request_owner)
      @feature = Fabricate(:feature, request: 'yey', request: @request)

      @price_quote = Fabricate(:price_quote, request: @request)
      #@feature.reload
      #@price_quote.reload
    end

  context "Estimating features" do

    describe "When creating a new PriceQuote" do
      it "has all the features belonging to the original Request" do
        @price_quote.features.first.title.should == 'yey'
        @price_quote.features[:feature_id]
      end

      it "The contractor can then estimate each feature belonging to the Request " do
        @price_quote.features.first.hours_estimated = 20
        @price_quote.save
      end
    end
  end

end
