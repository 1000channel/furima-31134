# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birth_date      | datetime | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | references | null: false, foreign_key: true |
| sales_status        | references | null: false, foreign_key: true |
| shopping_fee_status | references | null: false, foreign_key: true |
| prefecture          | references | null: false, foreign_key: true |
| scheduled_delivery  | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## order テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery


## delively テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | text       | null: false |
| prefecture   | text       | null: false |
| city         | text       | null: false |
| addresses    | text       | null: false |
| buillding    | text       |             |
| phone_number | references | null: false |

### Association

- belongs_to :order
