class UpdateForeignKeyForRevenues < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :revenues, :items
    add_foreign_key :revenues, :items, on_delete: :cascade
  end
end
