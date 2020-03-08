class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      # t.references :user_id, null: false, foreign_key: true
      # t.references :item_id, null: false, foreign_key: true
      t.string :text, null: false
      t.timestamps
    end
  end
end
