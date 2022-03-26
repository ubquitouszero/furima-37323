# README

# テーブル設計

## usersテーブル
| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| nickname   | string | null: false               |
| last_name  | string | null: false               |
| first_name | string | null: false               |
| birth_date | date   | null: false               |

### Association
- has_many :items
- has_many :sales_info

## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_info            | text       | null: false                    |
| item_category_id     | integer    | null: false                    |
| item_sales_status_id | integer    | null: false                    |
| fee_status_id        | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_schedule_id | integer    | null: false                    |
| item_price           | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :sales_info

## sales_infoテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

## 備考
以下のカラムはActiveHashを用いて実装する
- item_category_id
- item_sales_status_id
- fee_status_id
- prefecture_id
- delivery_schedule_id