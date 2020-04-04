class AddCreditToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :credit_card, foreign_key: true, null: false
  end
end
