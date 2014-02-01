Manageware::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :customers


  root 'sessions#new'


  match '/signup',  		to: 'users#new',            via: 'get'
  match '/show',  			to: 'users#show',          	via: 'get'
  

  match '/signin' ,  		to: 'sessions#new', 		via: 'get'
  match '/signout',  		to: 'sessions#destroy',     via: 'delete'

  match "/new_customer", 	to: 'customers#new',		via: 'get'
end
