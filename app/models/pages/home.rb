class Pages::Home < Cms::Page
  field :home_video_url

  def url(locale = I18n.locale)
    "/#{locale}"
  end


end