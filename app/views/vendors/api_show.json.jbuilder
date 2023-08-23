json.(@vendor, :outlet, :plate)
unless @location.nil?
  json.(@location, :address)
end

json.products @vendor.products, :name, :price, :code, :is_available, :image_name, :display_order

available_promotions = @vendor.promotions.any?
json.running_promotions available_promotions