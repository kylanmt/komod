class AddBrandColumnToClothe < ActiveRecord::Migration[7.1]
  def change
    add_column :clothes, :brand, :string
  end
end
