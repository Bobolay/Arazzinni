class CreateCategoryParameters < ActiveRecord::Migration
  def change
    create_table :checked_category_parameters do |t|
      t.belongs_to :category, polymorphic: true
      t.belongs_to :parameter
    end
  end
end
