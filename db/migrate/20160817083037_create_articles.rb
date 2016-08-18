class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.boolean :published
      t.date :released_on
      t.integer :views_count
      t.string :name
      t.string :url_fragment
      t.text :content
      t.attachment :image

      t.timestamps null: false
    end

    Article.create_translation_table(:name, :url_fragment, :content)
  end

  def down
    Article.drop_translation_table

    drop_table :articles
  end
end
