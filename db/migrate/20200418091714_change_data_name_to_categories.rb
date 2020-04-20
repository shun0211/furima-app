class ChangeDataNameToCategories < ActiveRecord::Migration[5.0]
  def up
      #  categoriesテーブル中のnameカラムのデータ型をtextに変更
    change_column :categories, :name, :text
  end
end
