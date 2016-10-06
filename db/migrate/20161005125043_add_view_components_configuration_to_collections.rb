class AddViewComponentsConfigurationToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :view_components_configuration, :text
  end
end
