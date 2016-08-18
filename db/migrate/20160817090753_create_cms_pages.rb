class CreateCmsPages < ActiveRecord::Migration
  def up
    Cms.create_pages_table
  end

  def down
    Cms.drop_pages_table
  end
end
