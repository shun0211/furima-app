class ChangeColumnToSellerNull < ActiveRecord::Migration[5.0]
  def up
    change_column_null :items, :seller_id, false
  end
end
