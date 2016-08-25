class EnumParameter < Parameter
  has_many :parameter_options, autosave: true
  accepts_nested_attributes_for :parameter_options, allow_destroy: true
  attr_accessible :parameter_options, :parameter_options_attributes

  globalize :name
end