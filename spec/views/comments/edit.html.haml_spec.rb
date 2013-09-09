require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :text => "MyText",
      :price_quote => nil,
      :user => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "textarea#comment_text[name=?]", "comment[text]"
      assert_select "input#comment_price_quote[name=?]", "comment[price_quote]"
      assert_select "input#comment_user[name=?]", "comment[user]"
    end
  end
end
