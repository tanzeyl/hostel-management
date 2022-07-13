class AddRoomIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :room_id, :bigint
  end
end
