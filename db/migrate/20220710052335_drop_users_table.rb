class DropUsersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_tables, force: :cascade
  end
end
