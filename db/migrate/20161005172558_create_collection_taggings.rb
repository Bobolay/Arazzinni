class CreateCollectionTaggings < ActiveRecord::Migration
  def change
    create_table :collection_taggings do |t|
      t.belongs_to :collection#, index: true, foreign_key: true
      t.belongs_to :collection_tag#, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
