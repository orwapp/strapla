require "spec_helper"

describe PriceQuotesController do
  describe "routing" do

    it "routes to #index" do
      get("/price_quotes").should route_to("price_quotes#index")
    end

    it "routes to #new" do
      get("/price_quotes/new").should route_to("price_quotes#new")
    end

    it "routes to #show" do
      get("/price_quotes/1").should route_to("price_quotes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/price_quotes/1/edit").should route_to("price_quotes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/price_quotes").should route_to("price_quotes#create")
    end

    it "routes to #update" do
      put("/price_quotes/1").should route_to("price_quotes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/price_quotes/1").should route_to("price_quotes#destroy", :id => "1")
    end

  end
end
