class Collection < ActiveRecord::Base


  attr_accessible *attribute_names

  globalize :name, :description, :url_fragment
  image :image, styles: { large: "672x672#", thumb: "356x356#" }

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_seo_tags
  has_cache
end
