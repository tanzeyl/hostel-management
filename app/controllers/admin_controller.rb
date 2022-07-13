class AdminController < ApplicationController

  def rooms
    render "managerooms"
  end

  def cancelRoom
    user = User.find(params[:id])
    room = HostelRoom.find(user.room_id)
    user.room_id = nil
    room.studentname = nil
    room.available = true
    user.save!
    room.save!
    redirect_to manage_rooms_path
  end

  def meals
    render "managemeals"
  end

  def cancelPlan
    user = User.find(params[:id])
    Meal.find(user.meal_id).destroy
    user.meal_id = nil
    user.save!
    redirect_to manage_meals_path
  end

end
