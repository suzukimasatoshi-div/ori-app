class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,         null: false
      t.text       :product_descriiption, null: false
      t.integer    :price, null: false
      t.integer    :shipping_charge_id,   null: false
      t.integer    :delivery_area_id,     null: false
      t.references :user,                 null:false, foreign_key: true
      t.timestamps
    end
  end
end