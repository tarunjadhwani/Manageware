Manageware::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :customers do
    resources :work_orders, only: [:new, :create]
    resources :drawing_reports, only: [:new, :create, :index]
    resources :payment_schedules, only: [:new, :create, :index]
    resources :site_visits, only: [:new, :create, :index]
    resources :work_schedules, only: [:new, :create, :index]
  end

  resources :work_orders, only: [:edit, :update]
  resources :drawing_reports, only: [:edit, :update]
  resources :payment_schedules, only: [:edit, :update]
  resources :site_visits, only: [:edit, :update]
  resources :work_schedules, only: [:edit, :update]

  root 'sessions#new'


  match '/signup',  		to: 'users#new',            via: 'get'
  match '/show',  			to: 'users#show',          	via: 'get'
  

  match '/signin' ,  		to: 'sessions#new', 		    via: 'get'
  match '/signout',  		to: 'sessions#destroy',     via: 'delete'

  match "/new_customer", 	to: 'customers#new',		  via: 'get'
  match '/show_customer', to: 'customers#show',     via: 'get'
end
