class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  def index
    @collections = Collection.published.sort_by_sorting_position
  end

  def show
    @collections = Collection.published.sort_by_sorting_position

    session[:filters] ||= {}
    filters_params ||= params[:filters]
    @filters_state = {}
  end

  def set_collection
    collection_id = params[:id]
    @collection = Collection.published.joins(:translations).where(collection_translations: { locale: I18n.locale, url_fragment: collection_id }).first
    if @collection.nil?
      render_not_found
    end
  end
end
