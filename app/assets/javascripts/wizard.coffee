open_wizard = ()->
  $('.step').first().addClass('current');

  $('.frame-carousel-1').owlCarousel({
    loop:false,
    margin:30,
    responsiveClass:true,
    navText: [""],
    responsive:{
      0:{
        items:1,
        nav:true
      },
      640:{
        items:1,
        nav:true
      },
      1024:{
        items:3,
        nav:true
      }
    }
  })


close_wizard = ()->
  $('.step').parent().children().removeClass('current');


wizard_prev_step = ()->
  $prev_step = $('.step.current').prev()
  $('.step.current').removeClass('current')
  $prev_step.addClass('current')


wizard_next_step = (e)->
  $step = $(this).closest(".step")
  has_selected_product = $step.find(".product.choosen").length > 0
  if has_selected_product
    $next_step = $('.step.current').next()
    $('.step.current').removeClass('current')
    $next_step.addClass('current')


wizard_carousel_item_click_handler = ()->
  $('.frame-carousel-2').owlCarousel({
    loop:false,
    margin:30,
    responsiveClass:true,
    navText: [""],
    responsive:{
      0:{
        items:1,
        nav:true
      },
      640:{
        items:1,
        nav:true
      },
      1024:{
        items:3,
        nav:true
      }
    }
  })


$(document).ready( ()->
  $('.buy-button').on("click", open_wizard)

  $('.close-popup').on("click", close_wizard)


  $('body').on('click', '.prev-step', wizard_prev_step)

  $('body').on('click', '.next-step', wizard_next_step)

  $('body').on('click', '.owl-2', wizard_carousel_item_click_handler)

  $choosen = $('.choose')
  $choosen.on('click', ()->
    $step = $(this).closest(".step")
    $step.find('.product').removeClass("choosen")
    $(this).addClass('choosen')
    $wizard = $(this).closest(".wizard.active")
    base_price = parseFloat($wizard.attr("data-base-price"))
    total_price = base_price
    prices = $(".product.choosen").map(
      ()->
        parseFloat($(this).attr("data-product-price"))
    )

    console.log "prices: ", prices

    for price_item in prices
      total_price = total_price + price_item

    $wizard.find(".total span").text("$#{total_price}")
  )
)
