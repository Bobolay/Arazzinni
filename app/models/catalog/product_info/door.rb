class Catalog::ProductInfo::Door < ActiveRecord::Base
  self.table_name = :catalog_products_door_info
  belongs_to :product, class_name: Catalog::Products::Door, foreign_key: :catalog_product_id
  globalize :possible_configurations
end
