require 'spec_helper'

describe WizzardController do

  describe "GET 'introduction'" do
    it "returns http success" do
      get 'introduction'
      response.should be_success
    end
  end

  describe "GET 'features'" do
    it "returns http success" do
      get 'features'
      response.should be_success
    end
  end

  describe "GET 'review'" do
    it "returns http success" do
      get 'review'
      response.should be_success
    end
  end

end
