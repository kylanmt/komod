class RenameTransactionTables < ActiveRecord::Migration[7.1]
  def change
    rename_table :transactions, :clothe_transactions
  end
end
