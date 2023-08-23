class CreatePromoProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :promo_products do |t|
      t.references :promotion, null: false
      t.references :product, null: false
      t.timestamps
    end
  end
end
