require 'spec_helper'

describe "requests/new" do
  before(:each) do
    assign(:request, stub_model(Request,
      :subject => "MyString",
      :description => "MyText",
      :goal => "MyText",
      :group => nil
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", requests_path, "post" do
      assert_select "input#request_subject[name=?]", "request[subject]"
      assert_select "textarea#request_description[name=?]", "request[description]"
      assert_select "textarea#request_goal[name=?]", "request[goal]"
      assert_select "input#request_group[name=?]", "request[group]"
    end
  end
end
