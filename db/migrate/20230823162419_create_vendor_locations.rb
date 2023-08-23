class CreateVendorLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_locations do |t|
      t.belongs_to :vendor, index: true
      t.string :address, null: false
      t.timestamps
    end
  end
end
