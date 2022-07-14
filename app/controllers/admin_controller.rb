class AdminController < ApplicationController

  def rooms
    render "managerooms"
  end

  def cancelRoom
    user = User.find(params[:id])
    room = HostelRoom.find(user.room_id)
    user.room_id = nil
    room.occupants -= 1
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

  def hostel
    render "newhostel"
  end

  def addHostel
    Hostel.create!(name: params[:name],
                            floors: params[:floors],
                            four_seater: params[:four_seater],
                            three_seater: params[:three_seater],
                            two_seater: params[:one_seater],
                            for: params[:gender])
   HostelRoom.create!(hostelname: params[:name], seater: 4, ac: true, number: 101, available: true, price: 110000, occupants: 0)
   HostelRoom.create!(hostelname: params[:name], seater: 3, ac: false, number: 202, available: true, price: 120000, occupants: 0)
   HostelRoom.create!(hostelname: params[:name], seater: 1, ac: false, number: 303, available: true, price: 130000, occupants: 0)
   flash[:error] = "New hostel has been created."
   redirect_to hostel_index_path
  end

  def admin
    render "admin"
  end

  def promote
    user = User.find(params[:id])
    user.role = "admin"
    user.save!
    flash[:error] = "#{user.first_name} has been promoted as admin."
    redirect_to hostel_index_path
  end

  def kitchen
    render "kitchen"
  end

  def add_item
    item = Kitchen.find(params[:id])
    item.quantity += params[:quantity].to_i
    item.save!
  end

  def new_item
    render "new_item"
  end

  def add_new_item
    Kitchen.create!(item: params[:name], quantity: params[:quan], price: params[:price])
    flash[:error] = "Item successfully added."
    redirect_to kitchen_path
  end

  def delete_item
    Kitchen.find(params[:id]).destroy
    flash[:error] = "Item successfully deleted."
    redirect_to kitchen_path
  end

  def price
    item = Kitchen.find(params[:id])
    item.price = params[:price]
    item.save!
    flash[:error] = "Price of #{item.item} updated successfully."
    redirect_to kitchen_path
  end

end
