class CreateTranslatableParameterOptions < ActiveRecord::Migration
  def up
    create_table :translatable_parameter_options do |t|
      t.integer :parameter_id
      t.string :value

      t.timestamps null: false
    end

    TranslatableParameterOption.create_translation_table(:value)
  end

  def down
    TranslatableParameterOption.drop_translation_table

    drop_table :translatable_parameter_options
  end
end
