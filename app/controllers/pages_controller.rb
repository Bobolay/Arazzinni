class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  self.layout "home"

  def index
  #   set_page_metadata(:home)
  end

  def about_us

  end

  def collections

  end

  def collection_one

  end

  def door_one
    @render_footer = false
  end

  def help

  end

  def publications

  end

  def publication_one

  end

  def contacts

  end

  def cart

  end

  def stub
    @render_header = false
    @render_footer = false
  end

  def error
    @render_header = false
    @render_footer = false

  end

  private

  def set_page_instance
  #   set_page_metadata(action_name)
  end
end