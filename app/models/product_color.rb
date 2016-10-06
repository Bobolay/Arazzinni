class ProductColor < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name

  image :avatar, styles: { small: "40x40#" }
end