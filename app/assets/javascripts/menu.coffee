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

$(".close-button").on "click", ()->
  $('.menu-wrapper').toggleClass("opened")
  $('body').removeClass("fixed")
  $('.close-button').removeClass("show-it")