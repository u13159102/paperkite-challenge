class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :vendor, index: true
      t.string :code, null: false
      t.integer :price, null: false
      t.string :name, null: false
      t.boolean :is_available, null: false, default: true
      t.string :image_name
      t.string :packaging_group
      t.integer :volume, null: false, default: 0
      t.integer :display_order
      t.timestamps
    end
  end
end
