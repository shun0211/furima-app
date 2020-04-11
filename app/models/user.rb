class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         kanji = /\A[一-龥]+\z/
         kana = /\A([ァ-ン]|ー)+\z/

  has_many :seller_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :buyer_items, foreign_key: "seller_id", class_name: "Item"
  has_many :likes
  has_many :comments
  has_many :purchase_historys
  has_many :credit_cards
  has_many :evaliations
  has_one :address

  validates :nickname, presence: true, length: { maximum: 25 }
  validates :familyname, presence: true, length: { maximum: 10 }, format: { with: kanji }
  validates :firstname, presence: true, length: { maximum: 10 }, format: { with: kanji }
  validates :firstname_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :familyname_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :password, presence: true, length: { in: 7..20 }
  validates :birth_year, presence: true, length: { maximum: 4 }
  validates :birth_month, presence: true, length: { maximum: 2 }
  validates :birth_day, presence: true, length: { maximum: 2 }
end
