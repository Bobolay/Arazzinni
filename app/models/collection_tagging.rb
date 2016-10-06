class CollectionTagging < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :collection
  belongs_to :collection_tag
end
