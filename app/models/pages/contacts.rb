class Pages::Contacts < Cms::Page
  has_one :page_info, class_name: PageInfo::Contacts, dependent: :destroy, foreign_key: :page_id
  accepts_nested_attributes_for :page_info
  attr_accessible :page_info, :page_info_attributes



  def self.page_info_class
    PageInfo::Contacts
  end


  # class Translation < ActiveRecord::Base
  #   def address
  #     "hi"
  #   end
  #
  #   def address=(val)
  #
  #   end
  # end



  def emails
    if page_info.nil?
      return nil
    end
    em = (page_info['emails'] || "").split("\r\n")
    if em.empty?
      return []
    else
      return em
    end
  end


  def phones
    if page_info.nil?
      return nil
    end

    em = (page_info['phones'] || "").split("\r\n")
    if em.empty?
      return []
    else
      return em
    end
  end
end