Rails.application.routes.draw do
  root 'home#index'
  resources :players
  resources :teams

  get 'show_player', to: 'home#show_player', as: 'show_player'
  put 'assign_player/:id', to: 'home#assign_player', as: 'assign_player'
  get 'rules', to: 'home#rules', as: 'rules'
end
