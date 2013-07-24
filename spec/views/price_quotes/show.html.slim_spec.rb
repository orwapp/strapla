require 'spec_helper'

describe "price_quotes/show" do
  before(:each) do
    @price_quote = assign(:price_quote, stub_model(PriceQuote,
      :user => nil,
      :request => nil,
      :price => 1.5,
      :hours_estimated => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
