class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.attachment :image
      t.string :url_fragment
      t.boolean :published

      t.timestamps null: false
    end

    Category.create_translation_table(:name, :description, :url_fragment)
  end

  def down
    Category.drop_translation_table

    drop_table :categories
  end
end
