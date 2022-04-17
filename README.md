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

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| fast_name          | string | null: false |
| last_name-kana     | string | null: false |
| fast_name-kana     | string | null: false |
| birth_date         | string | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                        | Type       | Options     |
| ----------------------------- | ---------- | ----------- |
| item_name                     | string     | null: false |
| item_info                     | text       | null: false |
| item_category_id              | integer    | null: false |
| item_sales_status-id          | integer    | null: false |
| item_shipping_free_status_id  | integer    | null: false |
| item_prefecture-id            | integer    | null: false |
| item_scheduled_delivery-id    | integer    | null: false |
| item_price                    | integer    | null: false |
| user                          | references | nill: false, foreign_key: true |

### Association

- belong_to :users


## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| item_prefecture_id | integer    | null: false |
| city               | string     | null: false |
| addresses          | string     | null: false |
| building           | string     | 
| phone_number       | string     | null: false |
| user               | references | nill: false, foreign_key: true |
| item               | references | nill: false, foreign_key: true |

### Association

- belong_to :users
- belong_to :items