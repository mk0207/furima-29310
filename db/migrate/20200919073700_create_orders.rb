class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal ,null: false
      t.integer :prefecture_id, null: false
      t.string :city ,null: false
      t.string :ad_num ,null: false
      t.string :building
      t.string :tell ,null: false
      t.references :orders_manage,  null: false,  foreign_key: true

      t.timestamps
    end
  end
end
