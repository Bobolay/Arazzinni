class CreateContactSlides < ActiveRecord::Migration
  def change
    create_table :contact_slides do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
