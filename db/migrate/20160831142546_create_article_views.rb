class CreateArticleViews < ActiveRecord::Migration
  def change
    create_table :article_views do |t|
      t.integer :article_id
      t.string :session_id
    end
    add_index :article_views, [:article_id, :session_id], :unique => true
  end
end
