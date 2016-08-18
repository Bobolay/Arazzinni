class Text < ActiveRecord::Base
  attr_accessible *attribute_names
  globalize :content

  def self.load_translations(force = false)
    if force || !self.class_variable_defined?(:@@_texts)
      texts = self.all.joins(:translations).where(text_translations: {locale: I18n.locale}).pluck("key", "text_translations.content")
      self.class_variable_set(:@@_texts, texts)
    end
  end

  def self.get_translations
    self.load_translations
    class_variable_get(:@@_texts)
  end

  def self.t(key, *args)
    str = (self.get_translations.select{|t| t[0] == key.to_s }.first)
    if str.present?
      return translated = str[1]
    end

    nil
  end
end
