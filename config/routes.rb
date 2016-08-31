Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  host "arazzinni.com.ua" do
    root to: "pages#stub", as: "stub_root"
  end


  root as: "root_without_locale", to: "application#root_without_locale"
  get "admin", to: redirect("/#{I18n.default_locale}/admin")

  scope ":locale", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
    devise_for :users
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    resources :articles, only: [:index, :show] do
      post as: "view", action: "view"
    end



    scope "collections" do
      root to: "collections#index", as: :collections
      scope ":id" do
        root to: "collections#show", as: :collection

        scope ":product_id" do
          root to: "products#show", as: :collection_product
        end
      end
    end


    scope "cart", controller: "cart" do
      root action: :index, as: :cart
    end

    root to: "pages#index"

    controller "static_pages" do
      %w(certificate delivery_and_payment guaranty).each do |static_page_key|
        get static_page_key, action: static_page_key, as: static_page_key
      end


    end

    controller :pages do
      get "about", action: "about"
      get "contacts", action: "contacts"
    end
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end

