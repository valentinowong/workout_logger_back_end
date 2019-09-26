Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'workouts/index'
      get 'workouts/create'
      get 'workouts/show'
      get 'workouts/update'
      get 'workouts/destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      
      resources :users do
        resources :workouts, only: [:index, :create, :update, :destroy]
      end

      resources :routines, only: [:index, :create, :show]
      
      resources :exercises, only: [:index]

      resources :completions, only: [:create, :update]

    end
  end
end

