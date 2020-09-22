class CreateOrdersManages < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_manages do |t|
      t.references :user,      null: false,  foreign_key: true
      t.references :item,      null: false,  foreign_key: true

      t.timestamps
    end
  end
end
