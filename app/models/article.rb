class Article < ActiveRecord::Base
  attr_accessible *attribute_names
  globalize :name, :url_fragment, :content

  image :image, styles: { large: "672x672#", thumb: "356x356#" }

  scope :published, -> { where(published: "t") }
  scope :sort_by_newest, -> { order("released_on desc") }


  has_seo_tags
  has_cache

  has_many :article_views

  def to_param
    self.url_fragment
  end

  def views_count
    article_views.count
  end

end
