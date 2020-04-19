class CreditCard < ApplicationRecord
  belongs_to :user

  #バリデーション
  # これから実装していきます
  # VALID_NUMBER_REGEX = /\A\d{14,16}\z/
  # VALID_YAER_REGEX = /\A\d{2}\z/
  # VALID_MONTH_REGEX = /\A\d{2}\z/
  # VALID_CVC_REGEX = /\A\d{3,4}\z/
  
  # validates :number, presence: true,
  #             format: { with: VALID_NUMBER_REGEX }
  # validates :exp_month, presence: true,
  #             format: { with: VALID_YAER_REGEX }
  # validates :exp_year, presence: true,
  #             format: { with: VALID_MONTH_REGEX }
  # validates :cvc, presence: true, length: { is: 3 },
  #             format: { with: VALID_CVC_REGEX }
end
