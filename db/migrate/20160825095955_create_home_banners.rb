class CreateHomeBanners < ActiveRecord::Migration
  def up
    create_table :home_banners do |t|
      t.integer :sorting_position
      t.boolean :published
      t.string :name
      t.text :description
      t.attachment :image
      t.linkable
      t.string :custom_url

      t.timestamps null: false
    end

    HomeBanner.create_translation_table(:name, :description, :custom_url)
  end

  def down
    HomeBanner.drop_translation_table

    drop_table :home_banners
  end
end
