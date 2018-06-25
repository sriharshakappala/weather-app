Rails.application.routes.draw do
  root to: "home#index"
  get '/weather/forecast' => 'weather#forecast'
end
