Rails.application.routes.draw do
  domains "ua", "com.ua", "arazzinni.com.ua" do
    root to: "pages#stub", as: "stub_root"
  end

  scope ":locale", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
    devise_for :users
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    resources :articles, only: [:index, :show]
    scope "collections" do
      root to: "collections#index", as: :collections
      scope ":id" do
        root to: "collections#show", as: :collection

        scope ":product_id" do
          root to: "products#show", as: :collection_product
        end
      end
    end




    root to: "pages#index"

    controller "static_pages" do
      %w(certificate delivery_and_payment guaranty).each do |static_page_key|
        get static_page_key, action: static_page_key, as: static_page_key
      end


    end

    controller :pages do
      get "about-us", action: "about_us"
      get "collections", action: "collections"
      get "collection-one", action: "collection_one"
      get "contact-us", action: "contact_us"
      get "cart", action: "cart"

    end
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end

