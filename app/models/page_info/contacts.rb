class PageInfo::Contacts < ActiveRecord::Base
  belongs_to :page, class_name: Pages::Contacts, foreign_key: :page_id
  attr_accessible *attribute_names
  globalize :address, :title, :large_title, :form_title, :form_description




end
