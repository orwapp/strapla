require 'spec_helper'
include LoginHelper
include IntegrationHelpers

describe "PriceQuotes" do
  before do
    @request_group = RequestGroup.create(title: 'iOS')
    @user = Fabricate(:user)
    @expert = Fabricate(:user, name: 'Richard Stallman')
    @expert.request_groups << @request_group
    @expert.should be_valid
  end


  it "An expert can send price quotes on requests" do
    pending
  end

  it "the creator of the request can read and accept price quotes" do
    pending
  end
end
