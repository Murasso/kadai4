Rails.application.routes.draw do
  resources :users, only: [:show,:index,:edit,:update]
  
  resources :books, only: [:edit, :index, :show, :create, :destroy, :update]
  devise_for :user
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  
end