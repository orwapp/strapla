require 'spec_helper'

describe User do
  it "is valid from Fabrication" do
    @user = Fabricate(:user)
    @user.should be_valid
  end
end
