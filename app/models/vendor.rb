class Vendor < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :promotions, dependent: :destroy
  has_many :locations, class_name: "VendorLocation", dependent: :destroy
end
