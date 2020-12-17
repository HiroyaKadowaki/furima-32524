# テーブル設計

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| email              | string  | null: false,unique:true |
| encrypted_password | string  | null: false             |
| nickname           | string  | null: false             |
| last_name          | string  | null: false             |
| first_name         | string  | null:false              |
| last_kana          | string  | null:false              |
| first_kana         | string  | null:false              |
| birth              | date    | null:false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| price          | integer    | null: false                    |
| burden_id      | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| province_id    | integer    | null: false                    |
| ship_day_id    | integer    | null: false                    |
| state_id       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ship
- belongs_to :item

## ships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| buiding       | string     |                                |
| phone_number  | string     | null:false                     |
| province_id   | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
