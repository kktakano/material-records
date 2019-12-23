class RemoveStockFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :stock, :string
  end
end
