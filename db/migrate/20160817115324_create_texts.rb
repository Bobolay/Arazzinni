class CreateTexts < ActiveRecord::Migration
  def up
    Cms.create_texts_table
  end

  def down
    Cms.drop_texts_table
  end
end
