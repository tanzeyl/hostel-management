class HostelController < ApplicationController
  def new
    if @current_user.room_id != nil
      render "booking"
    else
      render "index"
    end
  end

  def index
    render "new"
  end

  def create
    hostel = params[:hostel]
    floor = params[:floor].to_i
    flag = params[:ac]
    if flag == "yes"
      acc = true
    else
      acc = false
    end
    seaters = params[:roommates].to_i+1
    rooms = HostelRoom.where(hostelname: hostel, available: true, ac: acc, seater: seaters)
    if rooms != nil
      for room in rooms
        if room.number/100 == floor
          user = @current_user
          user.room_id = room.id
          user.save!
          room.studentname = @current_user.first_name + " " + @current_user.last_name
          room.available = false
          room.save!
          session[:room_id] = room.id
          break
        end
      end
    end
    redirect_to booking_path
  end

  def display
    render "booking"
  end

  def showmeal
    if @current_user.meal_id != nil
      render "mealconf"
    else
      render "meal"
    end
  end

end
