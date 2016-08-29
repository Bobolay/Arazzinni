class CreateCatalogProducts < ActiveRecord::Migration
  def up
    create_table :catalog_products do |t|
      t.string :type
      t.float :price
      t.string :name
      t.text :content
      t.attachment :image
      t.boolean :published
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end

    Catalog::Product.create_translation_table(:name, :content)
  end

  def down
    Catalog::Product.drop_translation_table

    drop_table :catalog_products
  end
end
