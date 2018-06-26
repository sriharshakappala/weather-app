require "rails_helper"

RSpec.describe City, :type => :model do
  it "should validate uniqueness of code" do
    City.create(code: 'del', city: 'Delhi', region: 'DL', country: 'India')
    city = City.new(code: 'del', city: 'Delhi NCR', region: 'DLNCR', country: 'India')
    city.valid?
    expect(city.errors[:code].size).to eq(1)
  end
end
