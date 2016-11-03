class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  def index
    @collections = Collection.published.sort_by_sorting_position
  end

  def show
    @collections = Collection.published.sort_by_sorting_position

    collection_product_prototype_name = @collection.collection_prototype.try(:name)
    session[:filters] ||= {}
    filters_params ||= params[:filters]
    @filters_state = {}
    @filterrific_session_key = "filterrific##{collection_product_prototype_name}"
    product_class = Object.const_get(collection_product_prototype_name)
    @collection_products = product_class.where(collection_id: @collection.id)

    @filterrific = initialize_filterrific(
        @collection_products,
        params[:filterrific],
        select_options: product_class.filterrific_select_options(@collection),
        #persistence_id: 'shared_key',
        persistence_id: @filterrific_session_key,
        #default_filter_params: {door_type: "interior"},

    ) or return

    @filterrific_session = session["collections#show"]
    @filterrific_session = session[@filterrific_session_key] if @filterrific_session.blank?

    @products = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def set_collection
    collection_id = params[:id]
    @collection = Collection.published.joins(:translations).where(collection_translations: { locale: I18n.locale, url_fragment: collection_id }).first
    if @collection.nil?
      render_not_found
    end
  end
end
