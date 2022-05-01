class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_info
      t.integer :item_category_id
      t.integer :item_sales_status_id
      t.integer :item_shipping_free_status_id
      t.integer :item_prefecture_id
      t.integer :item_scheduled_delivery_id
      t.integer :item_price
      t.references :user

      t.timestamps
    end
  end
end
