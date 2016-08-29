class CreateAboutSlides < ActiveRecord::Migration
  def change
    create_table :about_slides do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
