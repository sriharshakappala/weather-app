Rails.application.routes.draw do
  root to: "home#index"
  get '/weather/forecast'     => 'weather#forecast'
  get '/city/forecast/:code'  => 'weather#city_forecast', defaults: { format: 'json' }
  get 'new_home'              => 'home#new_index'

  resource :api do
    resource :v1 do
      get '/climate/:code' => 'api/v1/climate#index', defaults: { format: 'json' }
    end
  end

end
