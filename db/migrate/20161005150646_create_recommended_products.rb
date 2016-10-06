class CreateRecommendedProducts < ActiveRecord::Migration
  def change
    create_table :recommended_products do |t|
      t.belongs_to :product#, index: true, foreign_key: true
      t.belongs_to :recommended_product#, index: true, foreign_key: true
    end
  end
end
