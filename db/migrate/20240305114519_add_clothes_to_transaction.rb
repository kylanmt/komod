class AddClothesToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :clothe, foreign_key: true
  end
end
