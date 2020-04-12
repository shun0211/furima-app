class RemoveCostomerIdFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :costomer_id, :integer
  end
end
