class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.boolean :published
      t.boolean :featured
      t.boolean :best_proposition
      t.float :base_price
      t.string :name
      t.string :url_fragment
      t.text :description
      t.attachment :avatar

      t.timestamps null: false
    end

    Product.create_translation_table(:name, :url_fragment, :description)
  end

  def down
    Product.drop_translation_table

    drop_table :products
  end
end
