class WeatherController < ApplicationController

  def forecast
    @forecast = WeatherFetchService.new(params[:city]).forecast
  end

  def city_forecast
    @city = City.find_by_code params[:code]
    @forecast = Weather.for_city(params[:code]).forecast(10)
    @condition = @forecast.first
  end

end
