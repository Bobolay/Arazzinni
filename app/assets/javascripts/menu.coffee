window.toggle_menu = (menu_key = 'menu')->
  opened = $("body").hasClass("has-opened-#{menu_key}")
  if opened
    $("body").removeClass("has-opened-#{menu_key}")
    #restore_scroll_top()
  else
    #store_scroll_top()
    $("body").addClass("has-opened-#{menu_key}")


$(".header-container .menu").on "click", (e)->
  opened = toggle_menu()
  
$(".menu-button").on "click", ()->
  $('.menu-wrapper').toggleClass("opened")
  $('body').addClass("fixed")
  $('.close-button').addClass("show-it")
  setTimeout (->
      $(".navigation-wrapper, .menu-collection-container").addClass("show-it")
    ), 200

$(".close-button").on "click", ()->
  $('.menu-wrapper').toggleClass("opened")
  $('body').removeClass("fixed")
  $('.close-button').removeClass("show-it")
  setTimeout (->
      $(".navigation-wrapper, .menu-collection-container").removeClass("show-it")
    ), 0