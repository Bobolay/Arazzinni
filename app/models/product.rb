class Product < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :name, :url_fragment, :description, :label
  image :avatar, styles: { avatar: "230x480#" }

  scope :published, -> { where(published: 't') }
  scope :featured, -> { where(featured: 't') }
  scope :best, -> { where(best_offer: 't') }

  def url(locale = I18n.locale)
    #"/collections/collection_id/product_id"
    "/collections/collection_id/#{url_fragment}"
  end
end
