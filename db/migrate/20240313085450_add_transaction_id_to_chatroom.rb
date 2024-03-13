class AddTransactionIdToChatroom < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :chatroom, foreign_key: true
  end
end
