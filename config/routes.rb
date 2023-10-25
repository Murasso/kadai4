Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  
  resources :books, only: [:edit, :index, :show, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    
  end
  get "home/about" => "home#about", as: "about"
end