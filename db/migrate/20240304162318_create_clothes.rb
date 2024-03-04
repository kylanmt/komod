class CreateClothes < ActiveRecord::Migration[7.1]
  def change
    create_table :clothes do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :category
      t.integer :value
      t.boolean :available
      t.string :condition

      t.timestamps
    end
  end
end
