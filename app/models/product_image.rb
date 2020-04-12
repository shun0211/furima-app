class ProductImage < ApplicationRecord

  belongs_to :item, optional: true
  mount_uploader :product_image, ImageUploader

  # バリデーション
  validates :image, presence: true

end
