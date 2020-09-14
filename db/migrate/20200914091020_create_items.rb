class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.string  :description,    null: false
      t.string  :category_id,    null: false
      t.string  :status_id,      null: false
      t.string  :delfee_id,      null: false
      t.string  :ship_ori_id,    null: false
      t.string  :ship_day_id,    null: false
      t.integer :price,          null: false

      t.timestamps
    end
  end
end
