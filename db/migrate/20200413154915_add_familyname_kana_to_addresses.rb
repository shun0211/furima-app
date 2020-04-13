class AddFamilynameKanaToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :familyname_kana, :string, null: false
  end
end
