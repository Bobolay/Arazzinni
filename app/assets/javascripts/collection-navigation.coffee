$(document).ready ->
  nav = $('.nav-container .navigation-left, .nav-container .navigation-right')
  if nav.length
  	nav_top = nav.offset().top
  $(document).scroll ->
    if nav_top <= $(document).scrollTop()
      nav.addClass('fixed')
    else
    	nav.removeClass('fixed')