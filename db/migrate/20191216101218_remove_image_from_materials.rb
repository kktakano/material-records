class RemoveImageFromMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :image, :string
  end
end
