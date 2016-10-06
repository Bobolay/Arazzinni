class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ActionView::Helpers::OutputSafetyHelper
  include Cms::Helpers::ImageHelper
  include ActionView::Helpers::AssetUrlHelper
  include Cms::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include Cms::Helpers::PagesHelper
  include Cms::Helpers::MetaDataHelper
  include Cms::Helpers::NavigationHelper
  include Cms::Helpers::ActionView::UrlHelper
  include Cms::Helpers::TranslationHelper

  reload_text_translations

  reload_rails_admin_config


  before_action :initialize_request_host
  before_action :set_locale, unless: :admin_panel?
  before_action :set_admin_locale, if: :admin_panel?
  # before_action :initialize_rooms, unless: :admin_panel?
  # before_action :initialize_social_networks, unless: :admin_panel?
  # before_action :initialize_map, unless: :admin_panel?


  # before_action do
  #   render inline: MyClass.test
  #   false
  # end

  before_action :initialize_collections

  def initialize_collections
    @collections = Collection.published.sort_by_sorting_position
  end

  def admin_panel?
    admin = params[:controller].to_s.starts_with?("rails_admin")

    return admin
  end

  def render_not_found
    @render_header = false
    @render_footer = false
    render template: "errors/not_found.html.slim", status: 404
  end

  def set_admin_locale
    I18n.locale = :uk
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def root_without_locale
    redirect_to root_path(locale: I18n.locale)
  end

  def initialize_request_host
    Object.const_set("REQUEST_HOST", request.host)
  end

end
