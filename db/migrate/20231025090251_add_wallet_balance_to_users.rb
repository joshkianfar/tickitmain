class AddWalletBalanceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :wallet_balance, :decimal, default: 0.0, null: false
  end
end
