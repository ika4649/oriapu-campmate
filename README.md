# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :plans

## plans テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| date                     | datetime   | null: false |
| campsite_name            | string     | null: false |
| campsite_check_in        | datetime   | null: false |
| campsite_check_out       | datetime   | null: false |
| hotspring_name           | string     | null: false |
| hotspring_closing_time   | time       | null: false |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :meals
- has_many :buy_items

## meals テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| meal_name | string     | null: false                    |
| plan      | references | null: false, foreign_key: true |

### Association

- belongs_to :plans

## buy_items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buy_item        | string     | null: false                    |
| buy_next_item   | string     | null: false                    |
| plan            | references | null: false, foreign_key: true |

### Association

- belongs_to :plans