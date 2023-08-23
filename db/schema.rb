# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_23_162419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.bigint "vendor_id"
    t.string "code", null: false
    t.integer "price", null: false
    t.string "name", null: false
    t.boolean "is_available", default: true, null: false
    t.string "image_name"
    t.string "packaging_group"
    t.integer "volume", default: 0, null: false
    t.integer "display_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "promo_products", force: :cascade do |t|
    t.bigint "promotion_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_promo_products_on_product_id"
    t.index ["promotion_id"], name: "index_promo_products_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "vendor_id"
    t.integer "promotion_id", null: false
    t.string "promotion_description", null: false
    t.integer "promo_cost", null: false
    t.integer "promo_discount", default: 0
    t.string "image_name"
    t.string "promotion_type", null: false
    t.boolean "is_happy_hour", default: false, null: false
    t.integer "bundle_item_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_promotions_on_vendor_id"
  end

  create_table "vendor_locations", force: :cascade do |t|
    t.bigint "vendor_id"
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_vendor_locations_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "outlet", null: false
    t.string "plate", null: false
    t.integer "promo_expiry_seconds", default: 0, null: false
    t.boolean "is_happy_hour", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
