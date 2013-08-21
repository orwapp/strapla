require 'spec_helper'

describe "elevator_pitches/index" do
  before(:each) do
    assign(:elevator_pitches, [
      stub_model(ElevatorPitch,
        :text => "MyText",
        :request => nil
      ),
      stub_model(ElevatorPitch,
        :text => "MyText",
        :request => nil
      )
    ])
  end

  it "renders a list of elevator_pitches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
