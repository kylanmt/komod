class AddEventsToTransation < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :event, foreign_key: true
  end
end
