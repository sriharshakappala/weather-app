class WeatherApiService

  def initialize city_code
    @city_code = city_code
  end

  def forecast
    key = getKey :forecast
    return JSON.parse($redis.get(key)) if $redis.get(key).present?
    uri = getURL :forecast
    response = HttpService.get(uri, false)
    $redis.set(key, response)
    $redis.expire(key, 3600)
    return JSON.parse(response)
  end

  private

  def getURL type
    if type == :forecast
      "http://localhost:3001/city/forecast/#{@city_code}"
    end
  end

  def getKey type
    if type == :forecast
      "forecast_api_" + @city_code.split.join('-')
    end
  end

end
