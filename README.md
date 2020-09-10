## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| f_name_read | string | null: false |
| l_name_read | string | null: false |
| firstname   | string | null: false |
| lastname    | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :items
- has_many :buy_manages


## items テーブル
| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| name       | string  | null: false |
| description| text    | null: false |
| category_id| integer | null: false |
| status_id  | integer | null: false |
| delfee_id  | integer | null: false |
| ship_ori_id| integer | null: false |
| ship_day_id| integer | null: false |
| price      | integer | null: false |
| use_id     | integer | null: false, , foreign_key: true |

### Association
- has_many :users
- has_one :buy_manage


## buys テーブル
| Column       | Type    | Options                          |
| ------------ | ------- | -------------------------------- |
| postal       | string  | null: false                      |
| prefecture   | integer | null: false                      |
| city         | string  | null: false                      |
| ad_num       | string  | null: false                      |
| build        | string  |                                  |
| tell         | string  | null: false                      |
| buy_manage_id| integer | null: false, , foreign_key: true |

### Association
- has_one :buy_manages


## buy_manage テーブル
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |  
| item_id  | integer | null: false, foreign_key: true |  

### Association
- belongs_to :buy
- belongs_to :user
- belongs_to :item
