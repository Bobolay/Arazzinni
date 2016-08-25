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

  def my_attr

  end

  def my_attr=(val)

  end


  has_many :parameter_option_assignments, as: :resource


  belongs_to :category
  attr_accessible :category

  def dynamic_props
    #Parameter.all
    self.category.try(:parameters).try(:uniq) || []
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
end
