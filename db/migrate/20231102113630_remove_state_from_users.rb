class RemoveStateFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :state, :string
  end
end
