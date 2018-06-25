module WeatherHelper

  def parse_forecast_info forecast_info
    forecast_info = forecast_info['query']['results']['channel']['item']['forecast']
    dates = forecast_info.pluck('date')
    days = forecast_info.pluck('day')
    high = forecast_info.pluck('high')
    low = forecast_info.pluck('low')
    text = forecast_info.pluck('text')
    return dates, days, high, low, text
  end

end
