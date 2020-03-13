class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :prefectures, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
