class ChangeClotheCategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :clothes, :category
    add_reference :clothes, :category, foreign_key: true
  end
end
