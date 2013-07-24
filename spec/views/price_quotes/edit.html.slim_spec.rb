require 'spec_helper'

describe "price_quotes/edit" do
  before(:each) do
    @price_quote = assign(:price_quote, stub_model(PriceQuote,
      :user => nil,
      :request => nil,
      :price => 1.5,
      :hours_estimated => 1.5
    ))
  end

  it "renders the edit price_quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", price_quote_path(@price_quote), "post" do
      assert_select "input#price_quote_user[name=?]", "price_quote[user]"
      assert_select "input#price_quote_request[name=?]", "price_quote[request]"
      assert_select "input#price_quote_price[name=?]", "price_quote[price]"
      assert_select "input#price_quote_hours_estimated[name=?]", "price_quote[hours_estimated]"
    end
  end
end
