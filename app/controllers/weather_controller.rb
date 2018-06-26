class WeatherController < ApplicationController

  def forecast
    @forecast = WeatherFetchService.new(params[:city]).forecast
  end

  def city_forecast_api
    @forecast = WeatherApiService.new(params[:code]).forecast
  end

end
