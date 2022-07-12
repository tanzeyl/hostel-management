class MealController < ApplicationController
  def create
    price = 2000
    breakfast = params[:breakfast]
    lunch = params[:lunch]
    dinner = params[:dinner]
    if breakfast != nil
      price += 2000
    elsif lunch != nil
      price += 2000
    elsif dinner != nil
      prices += 2000
    elsif tiffin != nil
      price += 500
    end
    session[:price] = price
    redirect_to new_meal_path
  end

  def new
    render "mealconf"
  end
end
