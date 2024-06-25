Rails.application.routes.draw do
  mount ActiveStorageDB::Engine => '/active_storage_db'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

  get 'search', to: 'search#index'

  get 'login', to: 'login#new'
  post 'login', to: 'login#create'

  resources :manufacturers, only: [], param: :slug do
    resources :discs, only: [:show], param: :slug
  end

  namespace :admin do
    resources :discs, only: [:index, :edit, :destroy, :update]
  end

  root "home#index"

  if Rails.env.production?
    get '*path', to: 'home#index'
  end
end
