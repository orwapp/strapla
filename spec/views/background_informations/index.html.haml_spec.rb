require 'spec_helper'

describe "background_informations/index" do
  before(:each) do
    assign(:background_informations, [
      stub_model(BackgroundInformation,
        :elevator_pitch => "MyText",
        :background_information => "MyText",
        :no_list => "MyText",
        :what_can_go_wrong => "MyText",
        :what_is_it_going_to_give => "MyText",
        :what_is_the_frame => "MyText",
        :request => nil
      ),
      stub_model(BackgroundInformation,
        :elevator_pitch => "MyText",
        :background_information => "MyText",
        :no_list => "MyText",
        :what_can_go_wrong => "MyText",
        :what_is_it_going_to_give => "MyText",
        :what_is_the_frame => "MyText",
        :request => nil
      )
    ])
  end

  it "renders a list of background_informations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
