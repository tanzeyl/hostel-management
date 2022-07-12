class RemoveAcFromHostels < ActiveRecord::Migration[7.0]
  def change
    remove_column :hostels, :ac, :boolean
  end
end
