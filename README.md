# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|e_mail|string|null: false, add_index|
|password|string|null: false|

### Association
- has_many :items
- has_many :materials



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer||
|cost|decimal(6,1)|null: false|
|image|string||
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :use_materials


## materialsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|value|integer|null: false|
|unit|string|null: false|
|image|string||
|supplier|string||
|user_id|references|null: false,foreign_key: true|


### Association
- belongs_to :user
- has_many :use_materials


## use_materialsテーブル

|Column|Type|Options|
|------|----|-------|
|material_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|price|decimal(6,1)|null: false|

### Association
- belongs_to :item
- belongs_to :material
