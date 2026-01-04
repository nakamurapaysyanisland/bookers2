Rails.application.routes.draw do
  devise_for :users
  get "home/about" => "homes#about", as: "about"
  root to: "homes#top"
  resources :books
  resources :users, only:[:show, :edit, :index, :update]
end
