class AddMaterialToUseMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :use_materials, :item, foreign_key: true
  end
end
