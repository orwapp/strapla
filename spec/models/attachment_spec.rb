require 'spec_helper'

describe Attachment do
  before do
    @attachment = Fabricate(:attachment)
  end

  it "is valid from the fabric" do
    expect(@attachment).to be_valid
  end

end
