class CreateKitchen < ActiveRecord::Migration[7.0]
  def change
    create_table :kitchens do |t|
      t.string :item
      t.bigint :quantity
      t.bigint :price

      t.timestamps
    end
  end
end
