Rails.application.routes.draw do
  domains "ua", "com.ua", "arazzinni.com.ua" do
    root to: "pages#stub", as: "stub_root"
  end

  root to: "pages#index"

  controller :pages do
    get "about-us", action: "about_us"
    get "collections", action: "collections"
    get "collection-one", action: "collection_one"
    get "help", action: "help"
    get "publications", action: "publications"
    get "publication-one", action: "publication_one"
    get "door-one", action: "door_one"
    get "contact-us", action: "contact_us"
    get "not-found", action: "error"
    get "cart", action: "cart"

  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount Ckeditor::Engine => '/ckeditor'
  #devise_for :users


  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end

