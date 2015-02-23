Rails.application.routes.draw do
  
  root 'welcome#index'

  devise_for :users
  
  # get 'users' => 'users#index' 

  resources :users
  resources :producers 
  resources :tracks
  resources :comments

  

end
