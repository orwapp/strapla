require 'spec_helper'

describe ElevatorPitchController do

  describe "GET 'text:text'" do
    it "returns http success" do
      get 'text:text'
      response.should be_success
    end
  end

  describe "GET 'request:references'" do
    it "returns http success" do
      get 'request:references'
      response.should be_success
    end
  end

end
