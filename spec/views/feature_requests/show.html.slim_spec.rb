require 'spec_helper'

describe "feature_requests/show" do
  before(:each) do
    @feature_request = assign(:feature_request, stub_model(FeatureRequest,
      :user => nil,
      :user_story => "MyText",
      :request => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
