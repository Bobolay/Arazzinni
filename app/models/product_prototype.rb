class ProductPrototype < ActiveRecord::Base
  attr_accessible *attribute_names

  def configuration
    JSON.parse(self['configuration']).deep_stringify_keys rescue {}
  end

  def configuration_attributes
    configuration["attributes"]
  end

  def configuration_filters
    configuration["filters"]
  end

  def computed_configuration_filters
    configuration_attributes.keep_if{|k, v| !configuration_filters[k].nil? }.deep_merge(configuration_filters)
  end
end
