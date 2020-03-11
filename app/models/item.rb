class Item < ApplicationRecord
  belongs_to :buyer, class_name "User"
  belongs_to :seller, class_name "User"
  has_many :product_images
  has_many :likes
  has_many :comments
  has_one :purchase_history
  has_one :sell_history
  belongs_to :category
end
