class CreditCard < ApplicationRecord
  belongs_to :user

    # バリデーション
    validates :card_number, presence: true, length: { is: 16 }
    validates :exp_month, :exp_year, presence: true
    validates :cvc, presence: true, length: { is: 4 }
end


