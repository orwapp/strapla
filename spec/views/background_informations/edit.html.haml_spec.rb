require 'spec_helper'

describe "background_informations/edit" do
  before(:each) do
    @background_information = assign(:background_information, stub_model(BackgroundInformation,
      :elevator_pitch => "MyText",
      :background_information => "MyText",
      :no_list => "MyText",
      :what_can_go_wrong => "MyText",
      :what_is_it_going_to_give => "MyText",
      :what_is_the_frame => "MyText",
      :request => nil
    ))
  end

  it "renders the edit background_information form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", background_information_path(@background_information), "post" do
      assert_select "textarea#background_information_elevator_pitch[name=?]", "background_information[elevator_pitch]"
      assert_select "textarea#background_information_background_information[name=?]", "background_information[background_information]"
      assert_select "textarea#background_information_no_list[name=?]", "background_information[no_list]"
      assert_select "textarea#background_information_what_can_go_wrong[name=?]", "background_information[what_can_go_wrong]"
      assert_select "textarea#background_information_what_is_it_going_to_give[name=?]", "background_information[what_is_it_going_to_give]"
      assert_select "textarea#background_information_what_is_the_frame[name=?]", "background_information[what_is_the_frame]"
      assert_select "input#background_information_request[name=?]", "background_information[request]"
    end
  end
end
