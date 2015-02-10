Rails.application.routes.draw do
  
  root 'welcome#index'

  devise_for :users
  
  get 'users' => 'users#index' 
  
  resources :producers do
    resources :comments  
  end

  

end
