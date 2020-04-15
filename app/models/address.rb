class Address < ApplicationRecord
  belongs_to :user

  # バリデーション
  validates :postal_code, :prefectures, :municipality, :address, :firstname, :familyname, :firstname_kana, :familyname_kana, presence: true
  validates :postal_code,
            format: {
              with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
            }
  validates :firstname_kana, :familyname_kana,
            format: {
              with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
              message: "全角カタカナのみで入力して下さい"
            }
end
