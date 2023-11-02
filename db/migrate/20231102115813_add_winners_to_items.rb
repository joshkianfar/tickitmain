class AddWinnersToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :winner, null: true, foreign_key: { to_table: :users }
  end
end
