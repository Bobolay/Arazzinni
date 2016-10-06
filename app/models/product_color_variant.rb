class ProductColorVariant < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :product
  belongs_to :product_color

  image :avatar
end
