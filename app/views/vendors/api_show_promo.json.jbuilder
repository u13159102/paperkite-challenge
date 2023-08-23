json.promotion @promo, :promotion_id, :promotion_description, :promo_cost, :promo_discount, :image_name, :bundle_item_count

json.item_choices @promo.products, :name, :code, :is_available, :image_name, :display_order