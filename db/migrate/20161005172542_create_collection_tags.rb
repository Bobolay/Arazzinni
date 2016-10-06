class CreateCollectionTags < ActiveRecord::Migration
  def up
    create_table :collection_tags do |t|
      t.attachment :icon
      t.string :name

      t.timestamps null: false
    end

    CollectionTag.create_translation_table(:name)
  end

  def down
    CollectionTag.drop_translation_table

    drop_table :collection_tags
  end
end
