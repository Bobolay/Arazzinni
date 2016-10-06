class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :name
      t.attachment :avatar

      t.timestamps null: false
    end

    ProductColor.create_translation_table(:name)
  end
end
