Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'

  devise_for :users
  
  # get 'users' => 'users#index' 

  resources :users
  resources :tracks
  resources :comments

  

end
