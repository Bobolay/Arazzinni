def host?(*hosts)


  if hosts.blank? || !defined?(REQUEST_HOST)
    return true
  end

  hosts.include? REQUEST_HOST
end

module RailsAdminDynamicConfig
  class << self
    def configure_rails_admin(initial = true)
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



        if initial
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
            props do
              only ([Product] + DynamicModelGenerator.product_classes)
            end
            #edit_model
            nestable do
              only [HomeBanner, Collection]
            end

            ## With an audit adapter, you can add:
            # history_index
            # history_show
          end
        end

        config.include_models Attachable::Asset

        config.include_models *DynamicModelGenerator.product_classes

        config.model Attachable::Asset do
          visible false
          nested do
            field :data
            field :translations, :globalize_tabs
          end
        end

        config.model_translation Attachable::Asset do
          field :locale, :hidden
          field :data_alt
        end

        config.include_models CollectionTag
        config.model CollectionTag do
          navigation_label "catalog"
          field :icon
          field :translations, :globalize_tabs
        end

        config.model_translation CollectionTag do
          field :locale, :hidden
          field :name
        end

        config.include_models Collection
        config.model Collection do
          navigation_label "catalog"
          nestable_list(position_field: :sorting_position)

          edit do
            field :collection_prototype
            field :published
            field :translations, :globalize_tabs
            field :image
            field :collection_tags
            #field :product_schema
            js_field :view_components_configuration
          end
        end

        config.model_translation Collection do
          field :locale, :hidden
          field :name
          field :url_fragment
          field :description
        end

        config.model Product do
          navigation_label "catalog"
          #field :category
          group :base do
            field :collection
            field :published
            field :best_offer
            field :featured
            field :base_price
            field :avatar
            field :translations, :globalize_tabs
            field :product_color_variants
            field :gallery_images
            field :frame_images
            field :recommended_products do
              label "Recommended products(hardware)"
              associated_collection_scope_except_current
            end
          end

          group :wizard do
            [*Product::ASSOCIATED_PRODUCT_TABLES].each do |association_name|
              field association_name do
                associated_collection_scope_except_current
              end
            end
          end


        end

        config.model_translation Product do
          field :locale, :hidden
          field :name
          field :label

          field :url_fragment
          field :description
        end

        config.include_models ProductColor, ProductColorVariant

        config.model ProductColor do
          navigation_label "catalog"
          field :translations, :globalize_tabs
          field :avatar
        end

        config.model_translation ProductColor do
          field :locale, :hidden
          field :name
        end

        config.model ProductColorVariant do
          visible false
          nested do
            field :product_color
            field :avatar
          end
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

        config.include_models Article, Cms::Text, Product

        config.model Cms::Text do
          navigation_label "Локалізація"
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

        config.model_translation Cms::Text do
          field :locale, :hidden
          field :content
        end

        # static pages
        config.include_models Pages::Home, Pages::Articles, Pages::Collections, Pages::Contacts, Pages::About
        config.model Pages::Home do
          field :home_video_url
          field :seo_tags
        end

        config.include_models PageInfo::Contacts

        config.model Pages::Contacts do
          field :translations, :globalize_tabs
          field :seo_tags
          field :page_info
        end

        config.model PageInfo::Contacts do
          visible false
          field :translations, :globalize_tabs
          field :emails
          field :phones
          field :map_coordinates
        end

        config.model_translation PageInfo::Contacts do
          field :locale, :hidden
          field :address
          field :title
          field :large_title
          field :form_title
          field :form_description
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

        config.include_models Category, CategoryParameter
        config.model CategoryParameter do
          visible false

        end
        config.model Category do
          edit do
            field :translations, :globalize_tabs
            field :parameters do

            end
          end
        end

        config.model_translation Category do
          field :locale, :hidden
          field :name
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

        # abstract catalog
        #config.include_models ParameterOption
        config.include_models Parameter, TranslatableParameterOption

        config.model Parameter do
          field :key
          field :translations, :globalize_tabs
          field :translatable_parameter_options
        end

        config.model_translation Parameter do
          field :locale, :hidden
          field :name
        end

        config.model TranslatableParameterOption do
          visible false
          field :translations, :globalize_tabs
        end

        config.model_translation TranslatableParameterOption do
          field :locale, :hidden
          field :value
        end

        config.include_models HomeBanner
        config.model HomeBanner do
          nestable_list(position_field: :sorting_position)
          field :published
          linkable_field([Product, Article])
          field :translations, :globalize_tabs
          field :image

        end

        config.model_translation HomeBanner do
          field :locale, :hidden
          field :name
          field :description
          field :custom_url
        end


        # CATALOG

        config.include_models Catalog::Product
        config.include_models Catalog::ProductInfo::Door, Catalog::ProductInfo::Processor
        config.include_models Catalog::Products::Door, Catalog::Products::Processor

        %w(door processor).each do |class_key|
          config.model "Catalog::Products::#{class_key.camelize}" do
            field :published
            field :category
            field :price
            field :image
            field :translations, :globalize_tabs
            field :product_info
          end
        end

        config.model_translation Catalog::Product do
          field :locale, :hidden
          field :name
          field :content
        end

        config.model Catalog::ProductInfo::Door do
          field :door_type
          field :prefinished
          field :translations, :globalize_tabs
        end

        config.model_translation Catalog::ProductInfo::Door do
          field :locale, :hidden
          field :possible_configurations
        end

        config.model Catalog::ProductInfo::Processor do
          field :socket_type
          field :cores_quantity
          field :clock_speed
          field :processor_quantity
        end

        config.include_models ProductPrototype

        config.model ProductPrototype do
          navigation_label "catalog"
          field :name
          js_field :configuration
        end

        if !host?("localhost") || true
          hidden_models = [Catalog::Product, Catalog::Products::Door, Catalog::Products::Processor, Catalog::ProductInfo, Catalog::ProductInfo::Door, Catalog::ProductInfo::Processor, Category, Parameter]
          hidden_models.each do |model|
            config.model model do
              visible false
            end
          end
        end
      end
    end
  end
end