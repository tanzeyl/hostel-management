class MealController < ApplicationController

  def create
    price = 0
    breakfast = params[:breakfast]
    lunch = params[:lunch]
    dinner = params[:dinner]
    tiffin = params[:tiffin]
    if breakfast != nil
      price += 2000
    end
    if lunch != nil
      price += 2000
    end
    if dinner != nil
      price += 2000
    end
    if tiffin != nil
      price += 500
    end
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
    if !breakfast && !lunch && !dinner
      flash[:error] = "Please chose atleast one meal time."
    else
      new_meal = Meal.create!(breakfast: b, lunch: l, dinner: d, tiffin: t, price: price)
      user = @current_user
      user.meal_id = new_meal.id
      user.save!
      flash[:error] = "Meal plan changed successfully."
    end
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
