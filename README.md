# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| encrypted_password                   | string | null: false               |
| postal_code          | string     | null: false                             |
| address              | string     | null: false                             |
| phone_number         | string     | null: false                             |


### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## items テーブル

| Column                   | Type       | Options                         |
|--------------------------|------------|---------------------------------|
| product_name             | string     | null: false                     |
| product_descriiption     | text       | null: false                     |
| price                    | integer    | null: false                     | 
| shipping_charge_id       | integer    | null: false                     |
| delivery_area_id         | integer    | null: false                     | 
| user                     | references | null: false, foreign_key: true  |

### Association

## formsテーブル

### Association

