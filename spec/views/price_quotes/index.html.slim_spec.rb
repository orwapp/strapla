require 'spec_helper'

describe "price_quotes/index" do
  before(:each) do
    assign(:price_quotes, [
      stub_model(PriceQuote,
        :user => nil,
        :request => nil,
        :price => 1.5,
        :hours_estimated => 1.5
      ),
      stub_model(PriceQuote,
        :user => nil,
        :request => nil,
        :price => 1.5,
        :hours_estimated => 1.5
      )
    ])
  end

  it "renders a list of price_quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
