class AddPrototypeIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_prototype_id, :integer
  end
end
