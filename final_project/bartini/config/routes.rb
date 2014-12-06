Rails.application.routes.draw do
  # General Application Routes
  root to: 'sessions#new'

  get 'index', to: 'dashboard#index', as: 'index'

  post 'dashboard/sign_in' 

  get 'new', to: 'registration#new', as: 'registration_page'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "register" => "user_accounts#new", :as => "register"

  resources :user_accounts
  resources :sessions

  # Main Application Routes
  get 'prepare_drink', to: 'drink_management#prepare_drink', as: 'prepare_drink'
  post 'create_drink', to: 'drink_management#create_drink', as: 'create_drink'

  post 'add_ingredient', to: 'drink_management#add_ingredient', as: 'add_ingredient'
  post 'save_changes', to: 'drink_management#save_changes', as: 'save_changes'
  get 'edit_ingredients/:drink_id', to: 'drink_management#edit_ingredients', as: 'edit_ingredients' 
  post 'update_description', to: 'drink_management#update_description', as: 'update_description'
  get 'remove_ingredient/:drink_id/:ingredient_id', to: 'drink_management#remove_ingredient', as: 'remove_ingredient'
  post 'upload_file', to: 'drink_management#upload_file', as: 'upload_file'
  
  get 'drink_page/:drink_id', to: 'drink_management#drink_page', as: 'drink_page'

end
