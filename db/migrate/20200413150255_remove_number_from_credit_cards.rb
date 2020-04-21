class RemovberFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :number, :integer
  end
end
