# README

## Itemsテーブル
|Column|Type|Options|
|------|----|------|
|product_name|string|null: false, index: true|
|product_information|text|null:false|
|product_status|string|null: false|
|price|integer|null: false|
|product_condition|string|null: false|
|shipping_charge|integer|null: false|
|days_of_ship|string|null: false|
|seller_id|references|null:false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|brand|string|  |
|size|string|  |

### Association
- belongs_to :buyer, class_name "User"
- belongs_to :seller, class_name "User"
- has_many :product_images
- has_many :likes
- has_many :comments
- has_one :purchase_history
- has_one :sell_histry
- belongs_to :category

## Likesテーブル
|Column|Type|Options|
|------|----|------|
|user_id|references|null: false, foreign_key :true|
|item_id|references|null: false, foreign_key: true|

###　Association
- belongs_to :item
- belongs_to :user

## Commentsテーブル
|Column|Type|Options|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: ture|
|text|stirng|null: false|

### Association
- belongs_to :item
- belongs_to :user

## Product_images
|Column|Type|Options|
|------|----|------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## Categorysテーブル
|Column|Type|Options|
|------|----|------|
|category|string|null: false|
|ancestry|string|index:true|

### Association
- has_many :items
- has_ancestry

## usersテーブル
|Coloumn|Type|Options|
|------|----|------|
|firstname|string|null: false|
|familyname|string|null: false|
|firstname(kana)|string|null: false|
|familyname(kana)|string|null: false|
|phone_number|integer|null: false, unique:true|
|profile_image|string|
|nickname|string|null: false|
|profile_text|text|
|e_mail|string|null: false, unique: true|
|encrypted_password|string|null: false, unique: true|
|credit_card_id|references|null: false, foreign_key: true|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :seller_items, class_name: "Item"
- has_many :buyer_items, class_name: "Item"
- has_many :likes
- has_many :comments
- has_many :purchase_historys
- has_many :credit_cards
- has_many :evaliations
- has_one :address

## addressesテーブル
|Coloumn|Type|Options|
|-------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## purchase_hidtorysテーブル
|Coloumn|Type|Options|
|------|----|------|
|user_id|references|null: false, foregin_key: true|
|item_id|references|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :item

## sell_historysテーブル
|Coloumn|Type|Options|
|------|----|------|
|user_id|references|null: false, foregin_key: true|
|item_id|references|null: false, foregin_key: true|

### Associaton
- belongs_to :user
- belongs_to :item

## credit_cardsテーブル
|Coloumn|Type|Options|
|------|----|------|
|number|integer|null: false|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreigin_key: true|

### Associaton
- belongs_to :user

## evaluationsテーブル
|Coloumn|Type|Options|
|------|----|------|
|evaluation|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|evaluation_comment|text|
|item_id|references|null: false,foreign_key: true|

### Associaton
- belongs_to :user
- belongs_to :item