class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :view]
  def index
    @articles = Article.published.sort_by_newest
  end

  def show
    @articles = Article.published.sort_by_newest
  end

  def view
    #@article.update(views_count: (@article.views_count || 0) + 1)
    ArticleView.create(article_id: @article.id, session_id: session.id)

    render json: {}
  end

  def set_article
    article_id = params[:id] || params[:article_id]
    @article = Article.published.joins(:translations).where(article_translations: { locale: I18n.locale, url_fragment: article_id }).first
    if @article.nil?
      render_not_found
    end
  end
end
