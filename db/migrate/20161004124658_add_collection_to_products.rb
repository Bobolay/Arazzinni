class AddCollectionToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :collection, index: true, foreign_key: true
  end
end
