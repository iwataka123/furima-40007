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
- has_many :buying_histories

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| shipping_date_id   | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association

- has_one :buying_history
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_charge
- belongs_to :prefecture
- belongs_to :shipping_date
- belongs_to :user

## payments テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| municipality       | string     | null: false                   |
| address            | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| buying_history     | references | null: false,foreign_key: true |

### Association

- belongs_to :prefecture
- belongs_to :buying_history

## buying_histories テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| item               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment