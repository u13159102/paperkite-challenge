class Promotion < ApplicationRecord
  belongs_to :vendor

  has_many :promo_products, dependent: :destroy
  has_many :products, through: :promo_products, class_name: "Product", source: :product
end
