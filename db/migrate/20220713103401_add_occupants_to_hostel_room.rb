class AddOccupantsToHostelRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :hostel_rooms, :occupants, :bigint
  end
end
