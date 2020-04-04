class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :familyname, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :familyname_kana, :string, null: false
    add_column :users, :phone_number, :integer
    add_column :users, :profile_image, :string
    add_column :users, :nickname, :string, null: false
    add_column :users, :profile_text, :text
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :birth_month, :integer, null: false
    add_column :users, :birth_day, :integer, null: false
  end
end
