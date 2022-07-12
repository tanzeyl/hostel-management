Rails.application.routes.draw do
  #get "users", to: "users#index"
  resources :todos
  resources :users
  # resources :sessions
  post "users/login", to: "users#login"
  get "/", to: "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
end
