Gamez::Application.routes.draw do

  resources :user_sessions, :only => [:new, :create, :destroy]

  match '/login' => 'user_sessions#new', :as => :login
  match '/logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'user_sessions#new'

  namespace :admin do
    resources :users
    root :controller => 'admin', :action => 'index'
  end
  
end
