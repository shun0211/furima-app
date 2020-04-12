class AddCustomerIdToCreditCards < ActiveRecord::Migration[5.0]
  def change
    add_column :credit_cards, :customer_id, :string, null: false
  end
end
