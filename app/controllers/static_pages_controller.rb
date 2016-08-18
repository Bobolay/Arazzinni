class StaticPagesController < ApplicationController
  before_action :set_page_instance, except: [:index]
  def certificate
    show
  end

  def guaranty
    show
  end

  def delivery_and_payment
    show
  end


  def show
    @article_navigation = false
    render "articles/show"
  end

  private

  def set_page_instance
    set_page_metadata(action_name)
    @article = @page_instance
  end
end