class ChangeDataCardIdToCreditCards < ActiveRecord::Migration[5.0]
  def change
    change_column :credit_cards, :card_id, :string
  end
end
