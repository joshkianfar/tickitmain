class RemoveForeignKeyFromTickets < ActiveRecord::Migration[7.1]
  def up
    remove_foreign_key :tickets, column: :item_id
  end

  def down
    add_foreign_key :tickets, :items, column: :item_id
  end
end
