class AddForeignKeyToTicketsWithCascade < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :tickets, :items, column: :item_id, on_delete: :cascade
  end
end
