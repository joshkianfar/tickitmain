class AddMaxTicketsToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :max_tickets, :integer
  end
end
