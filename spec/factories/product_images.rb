FactoryBot.define do
  
  factory :product_image do
      image {File.open("#{Rails.root}/spec/fixtures/ゴリラ.jpg")}
      # アソシエーションはbelong_toの関係にある方に記載する
      association :item, factory: :item
  end
# end
end