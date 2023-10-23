Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  
  resources :books, only: [:edit, :index, :show, :create, :destroy, :update]
 
  get "home/about" => "home#about", as: "about"
end