FactoryBot.define do

  factory :credit_card do
    card_number     {"1234567890123456"}
    exp_month     {"12"}
    exp_year     {"21"}
    cvc     {"1234"}
  end
end