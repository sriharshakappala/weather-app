class WeatherFetchService

  def initialize city
    @city = city
  end

  def forecast
    uri = formQuery :forecast
    return JSON.parse(HttpService.get(uri))
  end

  private

  def formQuery type
    if type == :forecast
      "https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"#{@city}\")&format=json&env=store://datatables.org/alltableswithkeys"
    end
  end

end
