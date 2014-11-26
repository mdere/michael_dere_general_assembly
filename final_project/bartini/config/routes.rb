Rails.application.routes.draw do
   get 'prepare_drink', to: 'drink_management#prepare_drink', as: 'prepare_drink'
   put 'prepare_drink', to: 'drink_management#prepare_drink'
   get 'prepare_ingredients', to: 'drink_management#prepare_ingredients', as: 'prepare_ingredients'
end
