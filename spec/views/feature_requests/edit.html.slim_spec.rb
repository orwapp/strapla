require 'spec_helper'

describe "feature_requests/edit" do
  before(:each) do
    @feature_request = assign(:feature_request, stub_model(FeatureRequest,
      :user => nil,
      :user_story => "MyText",
      :request => nil
    ))
  end

  it "renders the edit feature_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feature_request_path(@feature_request), "post" do
      assert_select "input#feature_request_user[name=?]", "feature_request[user]"
      assert_select "textarea#feature_request_user_story[name=?]", "feature_request[user_story]"
      assert_select "input#feature_request_request[name=?]", "feature_request[request]"
    end
  end
end
