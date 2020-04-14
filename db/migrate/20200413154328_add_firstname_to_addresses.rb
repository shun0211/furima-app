class AddFirstnameToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :firstname, :string, null: false
  end
end
