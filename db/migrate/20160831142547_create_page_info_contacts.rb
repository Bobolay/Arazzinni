class CreatePageInfoContacts < ActiveRecord::Migration
  def up
    create_table :page_info_contacts do |t|
      t.belongs_to :page
      t.string :address
      t.text :phones
      t.text :emails
      t.string :title
      t.string :large_title
      t.string :form_title
      t.string :form_description
      t.string :map_coordinates
      t.timestamps null: false
    end

    PageInfo::Contacts.create_translation_table(:address, :title, :large_title, :form_title, :form_description)
  end

  def down
    drop_table :page_info_contacts

    PageInfo::Contacts.drop_translation_table
  end
end
