class Category < ActiveRecord::Base
  has_many :category_parameters, as: :category
  has_many :parameters, through: :category_parameters
  attr_accessible :category_parameters, :parameters, :parameter_ids, :category_parameter_ids

  globalize :name, :description, :url_fragment
end
