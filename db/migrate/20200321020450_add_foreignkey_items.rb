class AddForeignkeyItems < ActiveRecord::Migration[5.0]
  def change
    # itemsテーブルにprefecture_id(配送元の地域)の外部キーを追加
    add_reference :items, :prefecture
    # itemsテーブルにcategory_idの外部キーを追加
    add_reference :items, :category
  end
end
