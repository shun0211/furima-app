class RemoveExpirationDateFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :expiration_date, :integer
  end
end
