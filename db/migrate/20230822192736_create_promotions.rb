class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.belongs_to :vendor, index: true
      t.integer :promotion_id, null: false
      t.string :promotion_description, null: false
      t.integer :promo_cost, null: false
      t.integer :promo_discount, default: 0
      t.string :image_name
      t.string :promotion_type, null: false
      t.boolean :is_happy_hour, null: false, default: false
      t.integer :bundle_item_count
      t.timestamps
    end
  end
end
