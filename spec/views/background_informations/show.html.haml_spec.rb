require 'spec_helper'

describe "background_informations/show" do
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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
