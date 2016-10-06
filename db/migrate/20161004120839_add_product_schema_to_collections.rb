class AddProductSchemaToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :product_schema, :text
  end
end
