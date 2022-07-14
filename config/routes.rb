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
  get "add-admin" => "admin#admin", as: :add_admin
  post "add-admin" => "admin#addAdmin", as: :add_new_admin
  get "promote/:id" => "admin#promote"
  get "kitchen" => "admin#kitchen", as: :kitchen
  get "add_item/:id" => "admin#add_item"
  get "update_price/:id" => "admin#price"
  get "new_item" => "admin#new_item", as: :add_new
  get "update_price" => "admin#price", as: :update_price
  post "new_item" => "admin#add_new_item", as: :add_new_item
  get "delete_item/:id" => "admin#delete_item", as: :delete_item
end
