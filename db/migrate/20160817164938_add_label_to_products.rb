class AddLabelToProducts < ActiveRecord::Migration
  def change
    add_column :products, :label, :string
    add_column :product_translations, :label, :string
  end
end
