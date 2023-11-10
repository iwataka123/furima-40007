# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :payments

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category           | string     | null: false                   |
| status             | string     | null: false                   |
| delivery_charge    | string     | null: false                   |
| ship_from          | string     | null: false                   |
| shipping_date      | string     | null: false                   |
| price              | integer    | null: false                   |
| user_id            | references | null: false,foreign_key: true |

### Association

- has_one :payments
- belongs_to :user

## payments テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefectures        | string     | null: false                   |
| municipality       | string     | null: false                   |
| address            | string     | null: false                   |
| building           | string     | null: false                   |
| phone_number       | string     | null: false                   |
| user_id            | references | null: false,foreign_key: true |
| item_id            | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item