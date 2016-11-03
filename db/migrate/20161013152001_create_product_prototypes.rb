class CreateProductPrototypes < ActiveRecord::Migration
  def change
    create_table :product_prototypes do |t|
      t.string :name
      t.text :configuration

      t.timestamps null: false
    end
  end
end
