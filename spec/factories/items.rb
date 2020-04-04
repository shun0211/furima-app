FactoryBot.define do
  
  factory :item do
    product_name {"sumikaのDVD"}
    product_information {"最高"}
    price {2000}
    product_status {1}
    product_condition {1}
    shipping_charge {1}
    days_of_ship {1}
    prefecture_id {1}
  end
  
end