Rails.application.routes.draw do
  #get "users", to: "users#index"
  resources :todos
  resources :users
  post "users/login", to: "users#login"
  get "/", to: "home#index"
end
