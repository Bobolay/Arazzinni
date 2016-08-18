class CreateCmsSeoTags < ActiveRecord::Migration
  def up
    Cms.create_seo_tags_table
  end

  def down
    Cms.drop_seo_tags_table
  end
end
