require 'spec_helper'

describe "features/edit" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :request => nil,
      :text => "MyText"
    ))
  end

  it "renders the edit feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do
      assert_select "input#feature_request[name=?]", "feature[request]"
      assert_select "textarea#feature_text[name=?]", "feature[text]"
    end
  end
end
