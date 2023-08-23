class Product < ApplicationRecord
  belongs_to :vendor

  validates_uniqueness_of :vendor_id, scope: [:code]
end
