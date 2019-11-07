class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image
      t.integer :price
      t.decimal :cost, precision: 10, scale: 1, null: false
      t.integer :stock, null: false

      t.timestamps
    end
  end
  def decimal
    decimal.to_f
  end
end
