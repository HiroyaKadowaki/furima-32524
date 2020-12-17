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
| birth              | integer | null:false              |

### Association

- has_many :items
- has_many :orders
- has_many :history

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| burden      | integer    | null: false                    |
| category    | integer    | null: false                    |
| province    | integer    | null: false                    |
| ship_day    | integer    | null: false                    |
| state       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ship
- has_one :history

## order テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :ship

## ships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| buiding       | string     |                                |
| phone_number  | string     | null:false                     |
| item          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order

## history テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
