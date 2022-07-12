class AddForToHostel < ActiveRecord::Migration[7.0]
  def change
    add_column :hostels, :for, :string
  end
end
