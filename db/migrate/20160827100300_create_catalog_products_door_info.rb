class CreateCatalogProductsDoorInfo < ActiveRecord::Migration
  def up
    create_table :catalog_products_door_info do |t|
      t.belongs_to :catalog_product
      t.string :door_type
      t.boolean :prefinished
      t.text :possible_configurations

      t.timestamps null: false
    end

    Catalog::ProductInfo::Door.create_translation_table(:possible_configurations)
  end

  def down
    Catalog::ProductInfo::Door.drop_translation_table

    drop_table :catalog_products_door_info
  end
end
