class CreateHostel < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :name
      t.bigint :floors
      t.bigint :four_seater
      t.bigint :three_seater
      t.bigint :two_seater
      t.boolean :ac

      t.timestamps
    end
  end
end
