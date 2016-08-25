class Parameter < ActiveRecord::Base
  attr_accessible *attribute_names
  has_many :translatable_parameter_options, autosave: true
  accepts_nested_attributes_for :translatable_parameter_options, allow_destroy: true
  attr_accessible :translatable_parameter_options, :translatable_parameter_options_attributes

  globalize :name

  def values
    self.translatable_parameter_options.map {|opt| {value: opt.id, name: opt.value  } }
  end

  def values_arr
    values.map{|v| [v[:value], v[:name]] }
  end
end
