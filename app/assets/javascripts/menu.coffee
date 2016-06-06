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



$.clickOut(".contact-info-popup",
  ()->
    #console.log "close call-me-popup"
    $(".contact-info-popup").removeClass('show-info')
  {except: ".phone"}
)

$('.phone').on "click", (e)->
  $('.contact-info-popup').toggleClass('show-info')



is_touch_screen = 'ontouchstart' of document.documentElement

$('.cart').on "click", ()->
  $('.cart-popup').addClass('show-it')
  $('body').addClass("fixed")

$('.close-popup').on "click", ()->
  $('.cart-popup').removeClass('show-it')
  $('body').removeClass("fixed")