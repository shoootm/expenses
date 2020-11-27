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

| Column                  | Type        | Options                        |
| ----------------------- | ----------- | ------------------------------ |
| income                  | integer     | null: false                    |
| food_expense            | integer     |                                |
| necessities             | integer     |                                |
| clothes_expense         | integer     |                                |
| beauty_expense          | integer     |                                |
| entertainment_expense   | integer     |                                |
| medical_bill            | integer     |                                |
| education_cost          | integer     |                                |
| utility_costs           | integer     |                                |
| traveling_expense       | integer     |                                |
| other                   | integer     |                                |
| memo                    | text        |                                |
| user                    | references  | null: false, foreign_key: true |


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

