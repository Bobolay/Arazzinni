class AddPrototypeIdToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :collection_prototype_id, :integer
  end
end
