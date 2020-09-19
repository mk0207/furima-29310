class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :postal ,null: false
      t.integer :prefecture_id, null: false
      t.string :city ,null: false
      t.string :ad_num ,null: false
      t.string :build ,null: false
      t.integer :tell ,null: false

      t.timestamps
    end
  end
end
