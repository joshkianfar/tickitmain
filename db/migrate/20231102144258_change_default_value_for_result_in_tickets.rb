class ChangeDefaultValueForResultInTickets < ActiveRecord::Migration[7.1]
  def up
    change_column_default :tickets, :result, 'Pending'
  end

  def down
    change_column_default :tickets, :result, 'pending'
  end
end
