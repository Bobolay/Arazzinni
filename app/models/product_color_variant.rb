class ProductColorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :product
  belongs_to :product_color

  belongs_to :frame_specifications_product, -> { where(relation_key: "frame_specifications_product") }, class_name: Product

  image :avatar, styles: { thumb: "120x240#" }


end
