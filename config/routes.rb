Rails.application.routes.draw do
  root 'home#index'
  resources :players
  resources :teams
  resources :matches do
    get 'player_edit', to: 'matches#player_edit'
    post 'player_update', to: 'matches#player_update'
  end

  get 'show_player', to: 'home#show_player', as: 'show_player'
  get 'match_list', to: 'home#match_list', as: 'match_list'
  get 'results', to: 'home#results', as: 'results'
  get 'team_list', to: 'home#team_list', as: 'team_list'
  get 'rules', to: 'home#rules', as: 'rules'
  get 'auction', to: 'home#auction', as: 'auction'
  put 'assign_player/:id', to: 'home#assign_player', as: 'assign_player'
  get 'score_board', to: 'home#score_board', as: 'score_board'
end
