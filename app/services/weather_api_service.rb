class WeatherApiService

  def initialize city_code
    @city_code = city_code
  end

  def forecast
    uri = getURL :forecast
    response = HttpService.get(uri, false)
    return JSON.parse(response)
  end

  private

  def getURL type
    if type == :forecast
      "http://localhost:3001/city/forecast/#{@city_code}"
    end
  end

end
