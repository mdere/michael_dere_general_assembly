Rails.application.routes.draw do
   root to: 'sign_in#show', as: 'landing'

   get 'index/:id', to: 'dashboard#index', as: 'index'

   post 'dashboard/sign_in' 

   get 'prepare_drink', to: 'drink_management#prepare_drink', as: 'prepare_drink'
   post 'prepare_drink', to: 'drink_management#prepare_drink/'
   
   #get 'prepare_ingredients', to: 'drink_management#prepare_ingredients', as: 'prepare_ingredients'
   post 'prepare_ingredients', to: 'drink_management#prepare_ingredients', as: 'prepare_ingredients'
   
   get 'index', to: 'registration#index', as: 'registration_page'
   post 'create_user', to: 'registration#create_user', as: 'create_user'

end
