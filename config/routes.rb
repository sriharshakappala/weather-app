Rails.application.routes.draw do
  root to: "home#index"
  get '/weather/forecast'     => 'weather#forecast'

  resource :api do
    resource :v1 do
      get '/climate/:code' => 'api/v1/climate#index', defaults: { format: 'json' }
    end
  end

end
