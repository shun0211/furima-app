class ProductImage  < ApplicationRecord

  belongs_to :item, optional: true
  mount_uploader :Product_image, ImageUploader

  # バリデーション
  validates :image, presence: true

end
