class CreateProductColorVariants < ActiveRecord::Migration
  def change
    create_table :product_color_variants do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :product_color, index: true, foreign_key: true
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
