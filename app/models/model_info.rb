class ModelInfo
  attr_accessor :klass
  def self.find(class_or_class_name)
    if class_or_class_name.is_a?(Class)
      class_name = class_or_class_name.name
      klass = class_or_class_name
    else
      class_name = class_or_class_name
      klass = Object.const_get(class_name)
    end

    model_info = self.new

    model_info.klass = klass

    model_info
  end

  def properties
    klass.attribute_names.map{|prop_name|
      matched_column = klass.columns.select{|column| column.name == prop_name }.first
      if !matched_column
        next {name: prop_name}
      else
        next {name: prop_name, type: matched_column.cast_type.class.name.split("::").last.underscore}
      end
    }

  end
end