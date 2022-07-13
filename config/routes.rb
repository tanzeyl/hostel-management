Rails.application.routes.draw do
  #get "users", to: "users#index"
  delete "/signout" => "sessions#destroy", as: :destroy_session
  resources :todos
  resources :users
  resources :hostel
  resources :meal
  resources :admin
  post "users/login", to: "users#login"
  get "/" => "home#index"
  get "/hostel" => "hostel#index", as: :dash
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  post "/book-room" => "hostel#create", as: :room
  get "booking-confirmed" => "hostel#display", as: :booking
  get "buy-meal" => "meal#showmeal", as: :meals
  get "change-room" => "hostel#changeRoom", as: :room_change
  get "change-plan" => "meal#change", as: :plan_change
  get "manage-rooms" => "admin#rooms", as: :manage_rooms
  get "manage-meals" => "admin#meals", as: :manage_meals
  get "cancel_booking/:id" => "admin#cancelRoom"
  get "cancel_plan/:id" => "admin#cancelPlan"
  get "add-hostel" => "admin#hostel", as: :add_hostel
  post "add-hostel" => "admin#addHostel", as: :add_new_hostel
end
