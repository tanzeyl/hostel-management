class AddPriceToHostelRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :hostel_rooms, :price, :bigint
  end
end
