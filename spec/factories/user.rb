FactoryBot.define do

  factory :user do
    nickname              {"macha"}
    familyname          {"山田"}
    firstname          {"太郎"}
    familyname_kana           {"ヤマダ"}
    firstname_kana           {"タロウ"}
    birth_year              {"2000"}
    birth_month              {"10"}
    birth_day              {"10"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    phone_number         {"09012345678"}

  end

end