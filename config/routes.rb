Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users
  resources :producers 
  resources :tracks
  resources :comments
end
