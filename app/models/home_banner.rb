class HomeBanner < ActiveRecord::Base
  attr_accessible *attribute_names
  globalize :name, :description, :custom_url
  image :image, styles: { thumb: "192x108#", large: "1920x1080#" }

  scope :published, -> { where(published: "t") }
  scope :sort_by_sorting_position, -> { order("sorting_position desc") }


  has_link
  has_cache
  def cache_instances
    [Pages.home]
  end
end
