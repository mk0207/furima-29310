## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| f name read | string | null: false |
| l name read | string | null: false |
| firstname   | string | null: false |
| lastname    | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :users_items
- has_many :items, through :users_items
- has_many :buys


## items テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ex       | text   | null: false |
| price    | string | null: false |

### Association
- has_many :users_items
- has_many :users, through :users_items
- has_many :buys


## buys テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| c num     | string | null: false |
| c dm      | string | null: false |
| c dy      | string | null: false |
| postal    | string | null: false |
| prefecture| string | null: false |
| city      | string | null: false |
| ad num    | string | null: false |
| build     | string |             |
| tell      | string | null: false |
| user_id   | string | null: false |
| items_id  | string | null: false |

### Association
- belongs_to :user
- belongs_to :item
