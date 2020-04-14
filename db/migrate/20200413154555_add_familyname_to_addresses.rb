class AddFamilynameToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :familyname, :string, null: false
  end
end
