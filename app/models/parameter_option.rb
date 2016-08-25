class ParameterOption < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :parameter
  has_many :parameter_option_assignments
  has_many :resources, through: :parameter_option_assignments

  attr_accessible :parameter, :parameter_option_assignments, :parameter_option_assignment_ids, :resources, :resource_ids
end
