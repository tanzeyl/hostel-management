Rails.application.routes.draw do
  #get "users", to: "users#index"
  delete "/signout" => "sessions#destroy", as: :destroy_session
  resources :todos
  resources :users
  resources :hostel
  resources :meal
  resources :admin
  post "users/login", to: "users#login"
  get "/hostel" => "home#index", as: :dash
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  post "/book-room" => "hostel#create", as: :room
  get "booking-confirmed" => "hostel#display", as: :booking
  get "buy-meal" => "meal#showmeal", as: :meals
  get "change-room" => "hostel#changeRoom", as: :room_change
  get "change-plan" => "meal#change", as: :plan_change
end
