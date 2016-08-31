module ApplicationHelper
  def t(*args)
    @t_page_classes ||= Hash[Pages.all_instances.select{|c| c.try(:page_info).present? }.map{|p| c = p.class; pic = c.page_info_class; [c.name.split("::").last.underscore, {attribute_names: pic.attribute_names, page_info: p.page_info, page: p}] }]
    res = nil
    args.take_while{|a| a.is_a?(String) || a.is_a?(Symbol) }.each do |str|
      key_parts = str.split(".")
      if key_parts.length == 2 && (page_hash = @t_page_classes[key_parts.first]) && page_hash[:attribute_names].include?(key_parts[1])
        res = page_hash[:page].try(key_parts[1])
        res = page_hash[:page_info].try(key_parts[1]) if res.blank?
      end

      return res if res.present?
    end
    Cms.t(*args)
  end

  def text(*args)
    t(*args)
  end

  def main_menu_items
    recursive_menu(["home", "about", "articles", {key: :collections, hide: true}, "contacts"])
    #basic_menu("@sidebar_menu_entries", relation, active)
  end

  def main_menu_static_pages()
    recursive_menu(["certificate", "guaranty", "delivery_and_payment"])
    #basic_menu("@sidebar_menu_entries", relation, active)
  end

  def formatted_price(price)
    normalized_price = price
    if price.round(0) == price.round(2)
      normalized_price = price.round(0)
    end

    "$#{normalized_price}"
  end

  def formatted_date(date, locale = I18n.locale)
    if date.blank?
      return ""
    end
    month_number = date.month
    month_name = Cms.t("genitive_month_names.#{month_number - 1}")
    "#{date.day} #{month_name}"
  end
end
