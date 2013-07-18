require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :subject => "Subject",
        :description => "MyText",
        :goal => "MyText",
        :group => nil
      ),
      stub_model(Request,
        :subject => "Subject",
        :description => "MyText",
        :goal => "MyText",
        :group => nil
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
