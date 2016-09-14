$document.on "ready", ()->
  $article_container = $(".publication-wrapper")
  if $article_container.length > 0
    url = $article_container.attr("data-url")
    $.ajax({url: url, type: "post"})

  $(".article-content").find("img").each (index)->
    $img = $(this)
    $element = $img.closest("p")
    if !$element.length
      $element = $img

    image_src = $img.attr("src")
    $div = $("<div class='photo-frame'><div class='photo parallax-window' data-image-src='#{image_src}' data-parallax='scroll'></div></div>")
    $element.replaceWith($div)
    $div.parallax({imageSrc: image_src});

