class CreateCollections < ActiveRecord::Migration
  def up
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.string :url_fragment
      t.boolean :published
      t.integer :sorting_position

      t.timestamps null: false
    end

    Collection.create_translation_table(:name, :description, :url_fragment)
  end

  def down
    Collection.drop_translation_table

    drop_table :collections
  end
end
