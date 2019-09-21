## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string||
|mail|string||
|password|string||
|name|string||
|name_kana|string||
|birthday|int||
|phone_number|int||
|address_id|references|foreign_key: true|
|creditcard_id|references|foreign_key: true|

### Association
- has_many :items
- has_many :comments
- has_many :evaluations
- has_many :purchases
- has_many :item_likes

- has_one :address
- has_one :creditcard



## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postcode|int||
|prefecture|string||
|city|string||
|block|int||
|building|string||

### Association
- belongs_to :user



## creditcardテーブル

|Column|Type|Options|
|------|----|-------|
|creditcard_number|int|null: false|
|exp_month|int|null :false|
|exp_year|int|null :false|
|name|string|null :false|

### Association
- belongs_to :user


## itemテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|int|null: false|
|responsibility|boolean|null :false|
|location|string|null: false|
|day|int|null :false|
|price|int|null :false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :pictures
- has_many :item_likes

- belongs_to :user
- belongs_to :category

- has_one :purchase


## commentテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items
- has_ancestry

## item_likeテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|evaluation_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :evaluation


## evaluationテーブル

|Column|Type|Options|
|------|----|-------|
|eva|int|null: false|
|comment|text||
|user_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## purchaseテーブル

|Column|Type|Options|
|------|----|-------|
|status|int|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## picturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item