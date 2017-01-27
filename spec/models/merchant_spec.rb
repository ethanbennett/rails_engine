require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "returns nil if there isn't a date param" do
    expect(Merchant.date?(nil)).to eq([])
  end
end