class AddAvailableToHostelRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :hostel_rooms, :available, :boolean
  end
end
