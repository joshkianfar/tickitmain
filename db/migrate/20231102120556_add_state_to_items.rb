class AddStateToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :state, :string, default: 'active'
  end
end
