require 'spec_helper'

describe "feature_requests/index" do
  before(:each) do
    assign(:feature_requests, [
      stub_model(FeatureRequest,
        :user => nil,
        :user_story => "MyText",
        :request => nil
      ),
      stub_model(FeatureRequest,
        :user => nil,
        :user_story => "MyText",
        :request => nil
      )
    ])
  end

  it "renders a list of feature_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
