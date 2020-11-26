# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| address        | string  | null: false |

## association
belongs_to :expense
has_many :comments

## expenses テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
|  | string | null: false |
| text   | string | null: false |
| user   | references | null: false, foreign_key: true |


## association
belongs_to :user
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## association
belongs_to :expense
has_many :users

