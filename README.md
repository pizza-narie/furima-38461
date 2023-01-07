# README

## users テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| nickname           | string    | null: false                    |
| email              | string    | null: false, unique: true      |
| encrypted_password | string    | null: false                    |
| family_name        | string    | null: false                    |
| first_name         | string    | null: false                    |
| family_name_kana   | string    | null: false                    |
| first_name_kana    | string    | null: false                    |
| birth_day          | date      | null: false                    |

## Association
- has_many :items
- has_many :orders



## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false                    |
| description        | text      | null: false                    |
| price              | integer   | null: false                    |
| condition_id       | intege    | null: false                    |
| cost_id            | integer   | null: false                    |
| scheduled_day_id   | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| category_id        | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :order



## orders テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |


## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | ----------| ------------------------------ |
| post_code          | string    | null: false                    |
| prefecture_id      | integer   | null: false                    |
| city               | string    | null: false                    |
| address1           | string    | null: false                    |
| address2           | string    |                                |
| telephone          | string    | null: false                    |
| order              | reference | null: false, foreign_key: true |

## Association
- belongs_to :order

