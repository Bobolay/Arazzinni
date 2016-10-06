class CollectionTag < ActiveRecord::Base
  attr_accessible *attribute_names
  image :icon

  has_many :collection_taggings
  has_many :collections, through: :collection_taggings

  globalize :name

end
