class UpdateVendorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    vendor_state = HTTParty.get('https://ncakqcujsk.execute-api.ap-southeast-2.amazonaws.com/PKTechTest/products',
                                :headers => {'Content-Type' => 'application/json',
                                             'Accept' => "*/*",
                                             'Accept-Encoding' => "gzip, deflate, br",
                                             'Connection' => "keep-alive"
                                })
    vendor = Vendor.where(outlet: vendor_state["outletNumber"], plate: vendor_state["plateNumber"]).first

    unless vendor
      vendor ||= Vendor.new(outlet: vendor_state["outletNumber"], plate: vendor_state["plateNumber"], promo_expiry_seconds: vendor_state["promoExpirySeconds"], is_happy_hour: vendor_state["isHappyHour"])
      vendor.save
    end

    # === Set Vendor Locations ===
    location_state = vendor_state.select { |k,v| k.include? "vendorLocation" }.values

    location_state.each do |location|
      vendor.locations.new(address: location) unless vendor.locations.where(address: location).exists?
    end

    # === Add Vendor Products ===
    vendor_state["products"].each do |product_state|
      product = vendor.products.find_by_code(product_state["productCode"])
      product ||= Product.new(vendor: vendor)
      product_state.transform_keys!{ |k| k.sub(/product/, '').underscore.to_sym }

      product.attributes = product_state
      product.save
    end

    # === Add Vendor Promotions ===
    vendor_state["promotions"].each do |promotion_state|
      promo = vendor.promotions.find_by_promotion_id(promotion_state["promotionId"])
      promo ||= Promotion.new(vendor: vendor)
      promotion_state.transform_keys!{ |k| k.underscore.to_sym }
      items = promotion_state.select { |k,v| k.to_s.include? "item" }

      promo.attributes = promotion_state.reject { |k,v| k.to_s.include? "item" }
      promo.bundle_item_count = items.count
      promo.save

      items.values.flatten.uniq.each do |item|
        unless promo.products.where(code: item).exists?
          promo_product = PromoProduct.new(promotion_id: promo.id, product_id: Product.find_by_code(item).id)
          promo_product.save
        end
      end
    end

    #=== Clean up ===
    un_stocked_products = vendor.products.map(&:code) - vendor_state["products"].map { |p| p["productCode"] }
    stopped_promotions = vendor.promotions.map(&:promotion_id) - vendor_state["promotions"].map { |p| p["promotionId"] }

    matching_prods = vendor.products.where.not(code: un_stocked_products).destroy_all
    matching_promos = vendor.promotions.where.not(promotion_id: stopped_promotions).destroy_all
  end
end
