class RemoveStateFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :state, :string
  end
end
