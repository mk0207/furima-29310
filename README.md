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
- has_many :orders_manages


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
- belongs_to :user
- has_one :orders_manage


## orders_manages テーブル
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| item_id  | integer | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- belongs_to :item


## orders テーブル
| Column          | Type    | Options                          |
| --------------- | ------- | -------------------------------- |
| postal          | string  | null: false                      |
| prefecture_id   | integer | null: false                      |
| city            | string  | null: false                      |
| ad_num          | string  | null: false                      |
| building        | string  |                                  |
| tell            | string  | null: false                      |
| orders_manage_id   | integer | null: false, , foreign_key: true |

### Association
- belongs_to :orders_manage
