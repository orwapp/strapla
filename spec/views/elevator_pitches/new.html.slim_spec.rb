require 'spec_helper'

describe "elevator_pitches/new" do
  before(:each) do
    assign(:elevator_pitch, stub_model(ElevatorPitch,
      :text => "MyText",
      :request => nil
    ).as_new_record)
  end

  it "renders new elevator_pitch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", elevator_pitches_path, "post" do
      assert_select "textarea#elevator_pitch_text[name=?]", "elevator_pitch[text]"
      assert_select "input#elevator_pitch_request[name=?]", "elevator_pitch[request]"
    end
  end
end
