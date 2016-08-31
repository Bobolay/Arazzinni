module ApplicationHelper
  def t(*args)
    Cms.t(*args)
  end

  def text(*args)
    t(*args)
  end

  def main_menu_items()
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
