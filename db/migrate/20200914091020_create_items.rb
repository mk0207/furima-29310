class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.string  :description,    null: false
      t.integer :category_id,    null: false
      t.integer :status_id,      null: false
      t.integer :delfee_id,      null: false
      t.integer :ship_ori_id,    null: false
      t.integer :ship_day_id,    null: false
      t.integer :price,          null: false

      t.timestamps
    end
  end
end
