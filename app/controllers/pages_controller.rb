class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  def index
    set_page_metadata(:home)
    @featured_products = Product.published.featured
  end

  def about_us

  end

  def contacts

  end

  def cart

  end

  def stub
    @render_header = false
    @render_footer = false
  end

  private

  def set_page_instance
     set_page_metadata(action_name)
  end
end