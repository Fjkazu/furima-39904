# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kanalast_name      | string | null: false               |
| kanafirst_name     | string | null: false               |
| birthdate          | date   | null: false               |

### Association

- has_many :sends
- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| overview         | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_cost_id | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| how_many_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :send
- has_one    :buy

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## sends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building      | text       |                                |
| tel_number    | integer    | null: false                    |
| item_id       | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item