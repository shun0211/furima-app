class Item < ApplicationRecord
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :seller, class_name: "User", optional: true
  # dependent: :destroyオプション → 親レコードを削除した際、子レコードも同時に削除する。
  has_many :product_images, dependent: :destroy
  # accepts_nested_attributes_forメソッドより、親モデルを通じてネストしたモデルの関連レコードの登録・更新を可能にする
  # allow_destroy: true → 親レコードに関連した子レコードを削除することができる。
  accepts_nested_attributes_for :product_images, allow_destroy: true
  has_many :likes
  has_many :comments
  has_one :purchase_history
  has_one :sell_history
  belongs_to :category, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # バリデーション
  validates :product_name, :product_information, :product_status, :price, :product_condition, :shipping_charge, :days_of_ship, :prefecture_id, presence: true
  validates :product_name, length: { maximum: 40 }
  validates :product_information, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates_associated :product_images
  validate :product_images_number
  validates :category_id, presence: true

  private
  def product_images_number
    if product_images.size < 1 
      errors.add(:product_image, "product_images are blank")
    end
  end

end

