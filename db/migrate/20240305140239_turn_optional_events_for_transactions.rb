class TurnOptionalEventsForTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :transactions, :event_id, true
  end
end
