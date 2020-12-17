# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| name     | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| price       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ship

## orders テーブル

| Column | Type | Options |
| - | - | - |
| user        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :ship

## ships
| Column | Type | Options |
| - | - | - |
| card | string | null: false |
| time_limit | string | null: false |
| security_code | string | null: false |
| zip | string | null: false |
| city | string | null: false |
| address | string | null: false |
| buiding | string |  |
| phone_number | string | null:false |
| item | references | null: false, foreign_key: true |
| orders | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order
