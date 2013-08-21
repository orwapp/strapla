require "spec_helper"

describe ElevatorPitchesController do
  describe "routing" do

    it "routes to #index" do
      get("/elevator_pitches").should route_to("elevator_pitches#index")
    end

    it "routes to #new" do
      get("/elevator_pitches/new").should route_to("elevator_pitches#new")
    end

    it "routes to #show" do
      get("/elevator_pitches/1").should route_to("elevator_pitches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/elevator_pitches/1/edit").should route_to("elevator_pitches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/elevator_pitches").should route_to("elevator_pitches#create")
    end

    it "routes to #update" do
      put("/elevator_pitches/1").should route_to("elevator_pitches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/elevator_pitches/1").should route_to("elevator_pitches#destroy", :id => "1")
    end

  end
end
