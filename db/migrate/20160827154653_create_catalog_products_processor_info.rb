class CreateCatalogProductsProcessorInfo < ActiveRecord::Migration
  def change
    create_table :catalog_products_processor_info do |t|
      t.belongs_to :catalog_product
      t.string :socket_type
      t.integer :cores_quantity
      t.float :clock_speed
      t.integer :processor_quantity

      t.timestamps null: false
    end
  end
end
