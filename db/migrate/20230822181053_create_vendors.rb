class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :outlet, null: false
      t.string :plate, null: false
      t.integer :promo_expiry_seconds, null: false, default: 0
      t.boolean :is_happy_hour, default: false
      t.timestamps
    end
  end
end
