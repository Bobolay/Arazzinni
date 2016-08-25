class AddCategoryToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.belongs_to :category
    end
  end
end
