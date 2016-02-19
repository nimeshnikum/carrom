Rails.application.routes.draw do
  root 'home#index'
  resources :players
  resources :teams

  get 'show_player', to: 'home#show_player', as: 'show_player'
  get 'match_list', to: 'home#match_list', as: 'match_list'
  get 'team_list', to: 'home#team_list', as: 'team_list'
  get 'rules', to: 'home#rules', as: 'rules'
  get 'matches_list', to: 'home#matches_list', as: 'matches_list'
  get 'score_board', to: 'home#score_board', as: 'score_board'
end
