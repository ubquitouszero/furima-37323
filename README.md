# README

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :sales_infos

## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| info                 | text       | null: false                    |
| category_id          | integer    | null: false                    |
| sales_status_id      | integer    | null: false                    |
| fee_status_id        | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_schedule_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :sales_info

## sales_infosテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| delivery_info | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :delivery_info

## delivery_infosテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| sales_info    | references | null: false, foreign_key: true |

### Association
- belongs_to :sales_info

## 備考
以下のカラムはActiveHashを用いて実装する
- item_category_id
- item_sales_status_id
- fee_status_id
- prefecture_id
- delivery_schedule_id