class MealController < ApplicationController
  def create
    price = 2000
    breakfast = params[:breakfast]
    lunch = params[:lunch]
    dinner = params[:dinner]
    tiffin = params[:tiffin]
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
    b = false
    l = false
    d = false
    t = false
    if breakfast == "breakfast"
      b = true
    end
    if lunch == "lunch"
      l = true
    end
    if dinner == "dinner"
      d = true
    end
    if tiffin == "yes"
      t = true
    end
    new_meal = Meal.create!(breakfast: b, lunch: l, dinner: d, tiffin: t, price: price)
    user = @current_user
    user.meal_id = new_meal.id
    user.save!
    flash[:error] = "Meal plan changed successfully."
    redirect_to meals_path
  end

  def change
    render "meal"
  end

  def showmeal
    if @current_user.meal_id != nil
      render "mealconf"
    else
      render "meal"
    end
  end

end
