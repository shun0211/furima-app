class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  # dependent: :destroyオプション → 親レコードを削除した際、子レコードも同時に削除する。
  has_many :product_image, dependent: :destroy
  # accepts_nested_attributes_forメソッドより、親モデルを通じてネストしたモデルの関連レコードの登録・更新を可能にする
  # allow_destroy: true → 親レコードに関連した子レコードを削除することができる。
  accepts_nested_attributes_for :product_image, allow_destroy: true
  has_many :likes
  has_many :comments
  has_one :purchase_history
  has_one :sell_history
  belongs_to :category, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end

# class Item < ActiveRecord::Base
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :prefecture
# end
