class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  def index
    set_page_instance(:home)
    @featured_products = Product.published.featured
    @articles = Article.published.sort_by_newest.first(5)

    @home_slides = HomeBanner.published.sort_by_sorting_position
    @video_key = @page_instance.try(:home_video_url)
  end

  def about

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

  def set_page_instance(key = action_name)
     set_page_metadata(key)
     @page_key = key.to_sym
  end


end

