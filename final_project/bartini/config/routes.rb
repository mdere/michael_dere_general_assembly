Rails.application.routes.draw do
  # General Application Routes
  root to: 'sessions#new'

  get 'index/:id', to: 'dashboard#index', as: 'index'

  post 'dashboard/sign_in' 

  get 'new', to: 'registration#new', as: 'registration_page'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "register" => "user_accounts#new", :as => "register"

  resources :user_accounts
  resources :sessions

  # Main Application Routes
  get 'prepare_drink', to: 'drink_management#prepare_drink', as: 'prepare_drink'
  post 'prepare_drink', to: 'drink_management#prepare_drink/'

  #get 'prepare_ingredients', to: 'drink_management#prepare_ingredients', as: 'prepare_ingredients'
  post 'prepare_ingredients', to: 'drink_management#prepare_ingredients', as: 'prepare_ingredients'

end
