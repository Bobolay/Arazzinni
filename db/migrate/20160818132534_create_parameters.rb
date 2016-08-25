class CreateParameters < ActiveRecord::Migration
  def up
    create_table :parameters do |t|
      t.string :key
      t.attachment :icon
      t.string :name
      t.string :type

      t.timestamps null: false
    end

    Parameter.create_translation_table(:name)
  end

  def down
    Parameter.drop_translation_table

    drop_table :parameters
  end
end
