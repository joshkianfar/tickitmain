class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :transaction_type
      t.decimal :amount
      t.datetime :date_time

      t.timestamps
    end
  end
end
