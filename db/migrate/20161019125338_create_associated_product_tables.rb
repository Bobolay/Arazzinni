class CreateAssociatedProductTables < ActiveRecord::Migration
  def change
    [:frame_specifications_products, :plain_hinges_products, :locks_products, :functionality_products].each do |table_name|
      create_table table_name do |t|
        t.integer :product_id
        t.integer :related_product_id
      end
    end

  end
end
