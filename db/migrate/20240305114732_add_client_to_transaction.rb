class AddClientToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :client, foreign_key: { to_table: :users }
  end
end
