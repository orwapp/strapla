require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :subject => "MyString",
      :description => "MyText",
      :goal => "MyText",
      :group => nil
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", request_path(@request), "post" do
      assert_select "input#request_subject[name=?]", "request[subject]"
      assert_select "textarea#request_description[name=?]", "request[description]"
      assert_select "textarea#request_goal[name=?]", "request[goal]"
      assert_select "input#request_group[name=?]", "request[group]"
    end
  end
end
