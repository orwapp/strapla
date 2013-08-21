require 'spec_helper'

describe "elevator_pitches/edit" do
  before(:each) do
    @elevator_pitch = assign(:elevator_pitch, stub_model(ElevatorPitch,
      :text => "MyText",
      :request => nil
    ))
  end

  it "renders the edit elevator_pitch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", elevator_pitch_path(@elevator_pitch), "post" do
      assert_select "textarea#elevator_pitch_text[name=?]", "elevator_pitch[text]"
      assert_select "input#elevator_pitch_request[name=?]", "elevator_pitch[request]"
    end
  end
end
