class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.boolean :breakfast
      t.boolean :lunch
      t.boolean :dinner
      t.boolean :tiffin
      t.bigint :price

      t.timestamps
    end
  end
end
