class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :value, null: false
      t.string :unit, null: false
      t.string :image
      t.string :supplier

      t.timestamps
    end
  end
end
