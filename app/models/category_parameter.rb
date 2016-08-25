class CategoryParameter < ActiveRecord::Base
  self.table_name = :checked_category_parameters
  belongs_to :category, polymorphic: true
  belongs_to :parameter
end