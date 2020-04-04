class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false, index: true
      t.text :product_information, null: false
      t.integer :product_status, default: 1, null: false
      t.integer :price, null: false
      t.integer :product_condition, null: false
      t.integer :shipping_charge, null: false
      t.integer :days_of_ship, null: false
      t.references :seller, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.string :brand
      t.string :size

      t.timestamps
    end
  end
end
