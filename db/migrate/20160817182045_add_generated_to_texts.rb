class AddGeneratedToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :generated, :boolean
  end
end
