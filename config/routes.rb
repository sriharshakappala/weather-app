Rails.application.routes.draw do
  root to: "home#index"
  get '/weather/forecast'     => 'weather#forecast'
  get '/city/forecast/:code'  => 'weather#city_forecast', defaults: { format: 'json' }
end
