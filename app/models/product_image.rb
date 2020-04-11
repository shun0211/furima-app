class ProductImage < ApplicationRecord

  belongs_to :item, optional: true
  mount_uploader :Product_image, ImageUploader

  # バリデーション
  validates :Product_image, presence: true

end
