class ParameterOptionAssignment < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :parameter_option, class_name: TranslatableParameterOption
  belongs_to :resource, polymorphic: true
  has_one :parameter, through: :parameter_option

  attr_accessible :parameter_option, :resource
end