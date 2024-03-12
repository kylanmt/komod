class ChangeColumnsCategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :clothe_id
  end
end
