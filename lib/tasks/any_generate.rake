namespace :generate do

  desc "Generate random weather data"

  task :cities => :environment do
    cities = [
      {city: 'Mumbai', region: 'MH', country: 'India', code: 'mum'},
      {city: 'Chennai', region: 'TN', country: 'India', code: 'che'},
      {city: 'Santa Clara', region: 'CA', country: 'United States', code: 'sancla'}
    ]
    cities.each do |c|
      city = City.find_by_code c[:code]
      if city.nil?
        City.create(
          city: c[:city],
          region: c[:region],
          country: c[:country],
          code: c[:code]
        )
      end
    end
  end

  task :weather_data => :environment do
  end

end
