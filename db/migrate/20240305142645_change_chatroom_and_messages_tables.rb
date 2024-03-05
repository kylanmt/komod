class ChangeChatroomAndMessagesTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :chatrooms, :user_id
    remove_column :chatrooms, :message_id
    add_column :chatrooms, :name, :string
  end
end
