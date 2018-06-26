require "rails_helper"

RSpec.describe Weather, :type => :model do
  it "named scope `for_city` should return weather info for that city" do
    City.create(code: 'del', city: 'Delhi', region: 'DL', country: 'India')
    City.create(code: 'hyd', city: 'Hyderabad', region: 'TL', country: 'India')
    (Date.today..(Date.today + 5.days)).to_a.each do |date|
      ['hyd', 'del'].each do |code|
        Weather.create(
          code: code,
          date: date,
          high: (60..70).to_a.sample,
          low: (50..60).to_a.sample,
          condition: ['Thunderstorms', 'Scattered Thunderstorms'].sample
        )
      end
    end
    expect(Weather.for_city('hyd').map(&:code).uniq).to contain_exactly('hyd')
    expect(Weather.for_city('del').map(&:code).uniq).to contain_exactly('del')
  end
  it "named scope `forecast` should return forecast for specified days" do
    next_date = Date.today + 3.days
    City.create(code: 'del', city: 'Delhi', region: 'DL', country: 'India')
    City.create(code: 'hyd', city: 'Hyderabad', region: 'TL', country: 'India')
    (Date.today..(Date.today + 5.days)).to_a.each do |date|
      ['hyd', 'del'].each do |code|
        Weather.create(
          code: code,
          date: date,
          high: (60..70).to_a.sample,
          low: (50..60).to_a.sample,
          condition: ['Thunderstorms', 'Scattered Thunderstorms'].sample
        )
      end
    end
    expect(Weather.for_city('hyd').forecast(3).last.date).to eq(next_date)
  end
end
