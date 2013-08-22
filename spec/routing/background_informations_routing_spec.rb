require "spec_helper"

describe BackgroundInformationsController do
  describe "routing" do

    it "routes to #index" do
      get("/background_informations").should route_to("background_informations#index")
    end

    it "routes to #new" do
      get("/background_informations/new").should route_to("background_informations#new")
    end

    it "routes to #show" do
      get("/background_informations/1").should route_to("background_informations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/background_informations/1/edit").should route_to("background_informations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/background_informations").should route_to("background_informations#create")
    end

    it "routes to #update" do
      put("/background_informations/1").should route_to("background_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/background_informations/1").should route_to("background_informations#destroy", :id => "1")
    end

  end
end
