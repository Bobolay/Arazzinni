class Catalog::Products::Processor < Catalog::Product
  has_one :product_info, class_name: Catalog::ProductInfo::Processor, foreign_key: :catalog_product_id

  accepts_nested_attributes_for :product_info
  attr_accessible :product_info, :product_info_attributes
end
