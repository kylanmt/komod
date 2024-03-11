class AddOwnerToClothes < ActiveRecord::Migration[7.1]
  def change
    add_reference :clothes, :owner, foreign_key: { to_table: :users }
  end
end
