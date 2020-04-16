class ChangeDatatypeCategoryOfCategories < ActiveRecord::Migration[5.0]
  def change
    # categoriesテーブルのカラム名変更（category→name）
    rename_column :categories, :category, :name
  end

  def up
    # categoriesテーブル中のnameカラムのデータ型をtextに変更
    change_column :categories, :name, :text
  end
end
