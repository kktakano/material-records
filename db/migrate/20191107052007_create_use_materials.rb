class CreateUseMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :use_materials do |t|
      t.references :material, foreign_key: true
      t.decimal :price, null: false, precision: 10, scale: 1
      t.decimal :price, null: false, precision: 10, scale: 1

      t.timestamps
    end
  end
end
