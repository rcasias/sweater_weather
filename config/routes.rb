Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   get '/api/v1/forecast', to: 'api/v1/forecast#index'
   get '/api/v1/backgrounds', to: 'api/v1/backgrounds#index'
   get 'api/v1/breweries', to: 'api/v1/breweries#index'
   post 'api/v1/sessions', to: 'api/v1/sessions#create'
   post 'api/v1/road_trip', to: 'api/v1/road_trip#create'

   namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
    end
  end


end
