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
    month_names = { uk: %w(січня лютого березня квітня травня червня липня серпня вересня жовтня листопада грудня),
                    ru: %w(января февраля марта апреля мая июня июля августа сентября октября ноября декабря),
                    en: %w(january february march april may june jule august september october november december),
                    pl: %w(styczego lutego mar kwietnia maj czerw lip sierp wrzes pazdzier listopad grud)

    }
    date_time = date
    month_number = date_time.month
    month_name = month_names[locale.to_sym][month_number - 1]
    "#{date.day} #{month_name}"
  end
end
