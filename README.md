## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| firstname| string | null: false |
| lastname | string | null: false |
| birthday | string | null: false |

### Association
- has_many :users_items
- has_many :items, through :users_items
- has_many :buys


## items テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | string | null: false |
| name     | string | null: false |
| ex       | string | null: false |
| category | string | null: false |
| status   | string | null: false |
| delfee   | string | null: false |
| ship ori | string | null: false |
| ship day | string | null: false |
| price    | string | null: false |

### Association
- has_many :users_items
- has_many :users, through :users_items
- has_many :buys


## user_items テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


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
| build     | string | null: false |
| tell      | string | null: false |
| user_id   | string | null: false |
| items_id  | string | null: false |

### Association
- belongs_to :user
- belongs_to :item
