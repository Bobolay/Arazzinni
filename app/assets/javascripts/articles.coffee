$document.on "ready", ()->
  $article_container = $(".publication-wrapper")
  if $article_container.length > 0
    url = $article_container.attr("data-url")
    $.ajax({url: url, type: "post"})