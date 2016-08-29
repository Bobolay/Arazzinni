class Catalog::ProductInfo::Processor < ActiveRecord::Base
  self.table_name = :catalog_products_processor_info
  belongs_to :product, class_name: Catalog::Products::Processor, foreign_key: :catalog_product_id


end
