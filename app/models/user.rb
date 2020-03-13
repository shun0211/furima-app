class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :seller_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :buyer_items, foreign_key: "seller_id", class_name: "Item"
  has_many :likes
  has_many :comments
  has_many :purchase_historys
  has_many :credit_cards
  has_many :evaliations
  has_one :address
end
