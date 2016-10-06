class ProductsController < ApplicationController
  before_action :set_product
  def show
    @render_footer = false
    @products = Product.published
    @product_property_groups = @product.properties_for(nil, 2)


  end

  def set_product
    product_id = params[:product_id]
    @product = Product.published.joins(:translations).where(product_translations: { locale: I18n.locale, url_fragment: product_id }).first
    if @product.nil?
      render_not_found
    end
  end
end
