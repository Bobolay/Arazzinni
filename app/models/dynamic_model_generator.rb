class DynamicModelGenerator
  def self.application_classes
    i = 0; ObjectSpace.each_object{|o| if o.is_a?(Class) && o.name && o.name.split("::").length == 1   then;  puts o.name if i < 1000; i += 2; end }
  end

  def self.load
    klasses = []
    ProductPrototype.all.each do |prototype|
      class_name = prototype.name
      klass = Object.const_get(class_name) rescue Object.const_set(class_name, Class.new(Product))
      klasses << klass
      klass

      filterrific_available_filters = []
      filterrific_select_options = {}

      prototype.computed_configuration_filters.each do |attr_name, attr_config|
        scope_name = "with_properties_#{attr_name}"
        values = attr_config["values"]
        values_method = attr_config["values_method"]
        # if !values && ()
        #   values = prototype.send(values_method)
        # end



        filterrific_select_options[scope_name] = values ? values.map{|v| [v, v] } : values_method

        property_type = attr_config["type"]
        if property_type.present? && attr_config["generate_scope"] != false
          klass.send "#{property_type}_property_scope", attr_name, scope_name
        end

        klass.class_variable_set("@@#{attr_name}_values", values)
        klass.singleton_class.class_eval do
          define_method("#{attr_name}_values") do
            class_variable_get("@@#{attr_name}_values")
          end

          define_method("filterrific_select_options") do |collection|
            Hash[filterrific_select_options.map{|k, v|
              if v.is_a?(String) || v.is_a?(Symbol)
                next [k, collection.send(v)]
              end
              next [k, v]
              if v.nil?
                next [k, ["test"]]
              end

              if v.is_a?(Array)
                if v[0].nil? && v[1].nil?
                  next [k, ["test"]]
                else
                  puts "else next [k, v]"
                  next [k, v]
                end
              end

              if v.is_a?(String) || v.is_a?(Symbol)
                puts "v.is_a?(String) || v.is_a?(Symbol)"
                [k, collection.send(v)]
              else
                puts "[k, v]"
                [k, v]
              end
            }]
          end
        end
        klass
        filterrific_available_filters << scope_name
      end



      klass.filterrific(
          default_filter_params: {},
          available_filters: filterrific_available_filters
      )

      klass.rails_admin do
        label do
          klass.name.to_s.capitalize
        end

        label_plural do
          klass.name.to_s.pluralize.capitalize
        end
      end

      klass.send(:default_scope) do
        klass.joins(:collection).where(collections: { collection_prototype_id: prototype.id  })
      end

    end

    self.class_variable_set(:@@_product_models, klasses)

  end

  def self.product_classes
    self.class_variable_get(:@@_product_models) || [] rescue []
  end
end