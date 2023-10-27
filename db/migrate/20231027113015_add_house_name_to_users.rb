class AddHouseNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :house_name, :string
  end
end
