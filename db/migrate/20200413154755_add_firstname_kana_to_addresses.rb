class AddFirstnameKanaToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :firstname_kana, :string, null: false
  end
end
