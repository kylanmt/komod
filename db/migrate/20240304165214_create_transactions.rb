class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :price
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
