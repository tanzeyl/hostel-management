class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :studentname
      t.string :hostelname
      t.bigint :seater
      t.boolean :ac
      t.bigint :number

      t.timestamps
    end
  end
end
