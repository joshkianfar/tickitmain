class AddResultToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :result, :string, default: 'pending'
  end
end
