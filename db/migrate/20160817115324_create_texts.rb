class CreateTexts < ActiveRecord::Migration
  def up
    create_table :texts do |t|
      t.string :key
      t.text :content

      t.timestamps null: false
    end

    Text.create_translation_table(:content)
  end

  def down
    Text.drop_translation_table

    drop_table :texts
  end
end
