class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :seller_id,:integer, null: true
    change_column :items, :buyer_id,:integer, null: true
  end
  
  def down
    change_column :items, :seller_id,:integer, null: false
    change_column :items, :buyer_id,:integer, null: false
  end
end
