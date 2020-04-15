class RemoveSecurityCodeFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :security_code, :integer
  end
end
