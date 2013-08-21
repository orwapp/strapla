require 'spec_helper'

describe "elevator_pitches/show" do
  before(:each) do
    @elevator_pitch = assign(:elevator_pitch, stub_model(ElevatorPitch,
      :text => "MyText",
      :request => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
