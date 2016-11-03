class Collection < ActiveRecord::Base




  attr_accessible *attribute_names

  belongs_to :collection_prototype, foreign_key: :collection_prototype_id, class_name: ProductPrototype
  attr_accessible :collection_prototype

  globalize :name, :description, :url_fragment
  image :image, styles: { large: "672x672#", thumb: "356x356#", menu_thumb: "635x210#" }

  boolean_scope :published
  scope :sort_by_sorting_position, -> { order("sorting_position asc") }

  has_seo_tags
  has_cache

  has_many :products
  has_many :collection_taggings
  has_many :collection_tags, through: :collection_taggings
  has_many :product_colors, through: :products
  attr_accessible :collection_tags, :collection_taggings, :collection_tag_ids


  def json_value(k)
    v = self[k.to_s]
    begin
      res = JSON.parse(v)
      if res.blank?
        return nil
      else
        return res.deep_symbolize_keys
      end
    rescue
      return nil
    end
  end

  def product_schema
    json_value('product_schema')
  end

  def view_components_configuration
    json_value("view_components_configuration")
  end

  def filters
    # return [] if !view_components_configuration
    # overrided = view_components_configuration[:filters]
    # keys = overrided.keys
    # configured_filters = product_schema.keep_if{|k, v| k.to_s.in?(keys.map(&:to_s)) }
    # configured_filters.deep_merge(overrided)
    collection_prototype.computed_configuration_filters
  end

  def available_product_colors
    product_colors.map{|c| [c.name, c.id] }
  end
end
