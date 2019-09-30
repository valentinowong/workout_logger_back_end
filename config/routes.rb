Rails.application.routes.draw do 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/authenticate', to: 'auth#create'

      resources :users, only: [:create] do
        resources :workouts, only: [:index, :create, :update, :destroy]
      end

      resources :routines, only: [:index, :create]
      
      resources :exercises, only: [:index]

      resources :completions, only: [:create, :update]

    end
  end
end

