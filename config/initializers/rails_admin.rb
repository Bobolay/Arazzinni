RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  ## Cms models
  config.include_models Cms::MetaTags, Cms::Page

  config.model Cms::MetaTags do
    visible false
    field :translations, :globalize_tabs
  end

  config.model_translation Cms::MetaTags do
    field :locale, :hidden
    field :title
    field :keywords
    field :description
  end

  config.include_models Article, Text, Product

  config.model Text do
    edit do
      field :key
      field :translations, :globalize_tabs
    end

    list do
      field :key
      field :translations do
        pretty_value do
          o = @bindings[:object]
          translation_locales = Hash[I18n.available_locales.map{|locale| [locale, (t = o.translations_by_locale[locale]) && t.content.present?] }]
          translation_locales.map{|locale, translated| color = translated ? 'green' : 'red'; "<span style='color: #{color}'>#{locale}</span>" }.join(", ").html_safe
          # o.translations_by_locale
          # if o.promotional_price?
          #   "<strike style='color: gray'>#{original_price}</strike><font color='orange' style='margin-left: 5px'>#{o.promotional_price}</font>".html_safe
          # else
          #   original_price
          # end
        end
      end
    end
  end

  config.model_translation Text do
    field :locale, :hidden
    field :content
  end

  config.model Article do
    field :published
    field :image
    field :translations, :globalize_tabs
    field :released_on do
      date_format do
        :default
      end
    end
  end

  config.model_translation Article do
    field :locale, :hidden
    field :name
    field :url_fragment
    field :content, :ck_editor
  end

  config.model Product do
    field :published
    field :best_offer
    field :featured
    field :base_price
    field :avatar
    field :translations, :globalize_tabs
  end

  config.model_translation Product do
    field :locale, :hidden
    field :name
    field :label

    field :url_fragment
    field :description
  end

  ##static pages
  static_pages = ["DeliveryAndPayment", "Guaranty", "Certificate"]
  static_page_classes = static_pages.map{|s| "Pages::#{s}".constantize }
  #static_page_classes = [Pages::DeliveryAndPayment, Pages::Guaranty, Pages::Certificate]
  config.include_models *static_page_classes
  static_page_classes.each do |page_class|
    config.model page_class do
      field :translations, :globalize_tabs
      field :seo_tags
    end
  end

  config.model_translation Cms::Page do
    field :locale, :hidden
    field :name
    field :content, :ck_editor
  end

end
