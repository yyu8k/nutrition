# DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|phone_number|integer|unique: true|
|birthday|date||
|sex|string|null: false|
|height|integer|null: false|
|weight|integer|null: false|

### Association
- has_many :records
- has_many :foods


## Recordsテーブル
|Column|Type|Options|
|------|----|-------|
|date|date|null: false|
|user_id|references|null: false|
|food_id|references|null: false|

### Association
- belongs_to :user
- has_many :foods


## Foodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|kcal|integer|null: false|
|protein|integer|null: false|
|lipid|integer|null: false|
|carbo|integer|null: false|

### Association
- belongs_to :user
- belongs_to :record
