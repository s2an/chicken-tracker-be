Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :shelters, only: [:create, :update, :destroy, :show, :index] do
        resources :animals, only: [:create, :update, :destroy, :show, :index]
      end
    end
  end

  resources :shelters, only: [:show, :index] do
    resources :animals, only: [:show, :index]
  end

  root "welcome#index"
end
