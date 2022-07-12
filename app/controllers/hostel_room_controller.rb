class HostelRoomController < ApplicationController
  def new
    render "index"
  end

  def index
    render "new"
  end

  def create
    hostelRoom = HostelRoom.all

  end

end
