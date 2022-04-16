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
| email              | string | null: false |
| password           | string | null: false |
| last-name          | string | null: false |
| fast-name          | string | null: false |
| last-name-kana     | string | null: false |
| fast-name-kana     | string | null: false |
| birth-date         | string | null: false |

### Association



## items テーブル

| Column                     | Type       | Options     |
| -------------------------- | ---------- | ----------- |
| item-image                 | text       | null: false |
| item-name                  | text       | null: false |
| item-info                  | text       | null: false |
| item-category              | text       | null: false |
| item-sales-status          | text       | null: false |
| item-shipping-free-status  | text       | null: false |
| item-prefecture            | text       | null: false |
| item-scheduled-delivery    | text       | null: false |
| item-price                 | string     | null: false |
| user_id                    | references | nill: false, foreign_key: true |

### Association



## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal-code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| addresses          | string     | null: false |
| building           | string     | null: false |
| phone-number       | string     | null: false |
| user-id            | references | nill: false, foreign_key: true |
| item-id            | references | nill: false, foreign_key: true |

### Association

