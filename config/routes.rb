Rails.application.routes.draw do
  root 'home#home'

  resources :games
  resources :teams
end
