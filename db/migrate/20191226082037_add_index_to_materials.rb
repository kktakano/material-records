class AddIndexToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_index :materials,  :name
  end
end
