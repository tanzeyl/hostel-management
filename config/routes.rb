Rails.application.routes.draw do
  #get "users", to: "users#index"
  delete "/signout" => "sessions#destroy", as: :destroy_session
  resources :todos
  resources :users
  resources :hostel
  resources :meal
  post "users/login", to: "users#login"
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  post "/book-room" => "hostel#create", as: :room
  get "booking-confirmed" => "hostel#display", as: :booking
  get "buy-meal" => "hostel#showmeal", as: :meals
end
