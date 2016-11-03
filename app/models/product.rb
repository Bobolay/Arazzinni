class Product < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :product_prototype, foreign_key: :product_prototype_id
  attr_accessible :product_prototype

  has_many :product_color_variants
  has_many :product_colors, through: :product_color_variants
  accepts_nested_attributes_for :product_color_variants, allow_destroy: true
  attr_accessible :product_color_variants, :product_color_variant_ids, :product_color_variants_attributes


  globalize :name, :url_fragment, :description, :label
  image :avatar, styles: { avatar: "230x480#", thumb: "120x240#" }

  boolean_scope :published
  boolean_scope :featured
  boolean_scope :best_offer, :best, false
  range_scope :base_price, :with_price_between




  has_images :gallery_images, styles: { large: "1100x660#", thumb: "200x100#" }
  has_images :frame_images


  has_and_belongs_to_many :recommended_products, join_table: :recommended_products, class_name: Product, foreign_key: :product_id, association_foreign_key: :recommended_product_id

  ASSOCIATED_PRODUCT_TABLES = [:frame_specifications_products, :plain_hinges_products, :locks_products, :functionality_products]
  ASSOCIATED_PRODUCT_TABLES.each do |table_name|
    table_name_str = table_name.to_s
    has_and_belongs_to_many table_name, join_table: table_name, class_name: Product, foreign_key: :product_id, association_foreign_key: :related_product_id
    attr_accessible table_name, "#{table_name_str.singularize}_ids"
  end

  attr_accessible :product_relations, :product_relation_ids

  attr_accessible :frame_specifications_products, :frame_specifications_product_ids

  attr_accessible :recommended_products, :recommended_product_ids


  #validates :price, presence: true

  def url(locale = I18n.locale)
    #"/collections/collection_id/product_id"
    if !collection
      return nil
    end
    collection_url = collection.url(locale)
    if !collection_url.end_with?("/")
      collection_url = "#{collection_url}/"
    end
    "#{collection_url}#{translations_by_locale[locale].url_fragment}"
  end

  def my_attr

  end

  def my_attr=(val)

  end


  has_many :parameter_option_assignments, as: :resource


  belongs_to :category
  attr_accessible :category

  belongs_to :collection
  attr_accessible :collection

  def dynamic_props
    #Parameter.all
    self.category.try(:parameters).try(:uniq) || []
  end

  def dynamic_fields
    if self.collection.nil? || self.collection.collection_prototype.nil?
      return nil
    end
    #self.collection.product_schema
    self.collection.collection_prototype.configuration_attributes
  end

  def prop_option(prop_or_prop_id)
    if prop_or_prop_id.is_a?(ActiveRecord::Base)
      prop = prop_or_prop_id
    else
      prop = Parameter.find(prop_or_prop_id)
    end

    opt_ids = prop.translatable_parameter_options.pluck(:id)
    prop_assignment = self.parameter_option_assignments.where(parameter_option_id: opt_ids).first
    if prop_assignment.nil?
      return nil
    end

    prop_assignment.parameter_option
  end

  def prop_pretty_value(prop_id)
   prop_option(prop_id).try(:value)
  end

  def assign_prop(option_id)
    opt = TranslatableParameterOption.find(option_id)
    prop = opt.parameter
    prop_option_ids = prop.translatable_parameter_options.pluck(:id)
    opt_assignment = self.parameter_option_assignments.where(parameter_option_id: prop_option_ids).first
    if opt_assignment.nil?
      self.parameter_option_assignments.create(parameter_option_id: option_id, resource_type: self.class.name, resource_id: self.id)
    else
      if opt_assignment.parameter_option_id != option_id
        opt_assignment.parameter = prop
        opt_assignment.parameter_option_id = option_id
        opt_assignment.save

      end
    end


  end

  def properties_for(component = nil, split_to_groups = 1)
    if !properties
      return []
    end
    if component && collection.try(:view_components_configuration)
      keys = collection.view_components_configuration[component.to_sym][:properties]
    else
      keys = false
    end
    props = Hash[properties.keep_if{|k, v| !keys || keys.map(&:to_s).include?(k.to_s)  }.map{|k, v| [k.to_sym, v] }]
    defaults = Hash[collection.product_schema
                        .keep_if{|k, v| ( !keys || keys.map(&:to_s).include?(k.to_s)) && v.has_key?(:default)  }
                        .map{|k, v| [k.to_sym, v[:default]] }]

    res = defaults.merge(props)
    if !res.keys.any?
      return []
    end
    if split_to_groups > 1
      res.in_groups(split_to_groups, false)
    else
      res
    end
  end

  def self.string_property_scope(k, scope_name = nil, prefix = "properties_")
    scope_name ||= "with_#{prefix}#{k}"
    scope scope_name, ->(value){ where("properties ->>'#{k}' = '#{value}'") }
  end

  def self.enum_property_scope(k, scope_name = nil, prefix = nil)
    string_property_scope(k, scope_name, prefix)
  end

  enum_property_scope :style
  enum_property_scope :door_type

  def self.init_scopes
    #Collection.all.map(&:filters).select(&:present?).select{|item|   }
  end

  if self.table_exists?
    self.init_scopes
  end

  def available_colors

  end

  def self.register_filterrific_filter(name, select_options = nil)
    filters_var_name = "@@_filterrific_registered_filters"
    options_var_name =
    filters = class_variable_get(filters_var_name) rescue []
    if !filters.map(&:to_s).include?(name)
      filters << name.to_sym
      class_variable_set(filters_var_name, filters)
    end

    filters
  end

  scope :with_color, ->(color_id) { joins(product_color_variants: :product_color).where(product_colors: { id: color_id }) }
  register_filterrific_filter(:with_color)
end
