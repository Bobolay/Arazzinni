is_touch_screen = 'ontouchstart' of document.documentElement

init_fp = ()->
	$fullpage = $('#fullpage')
	if is_touch_screen || window.innerWidth < 640
		if $fullpage.hasClass("initialized-fullpage")
			$fullpage.removeClass("initialized-fullpage")
			$.fn.fullpage.destroy('all')
		return
	else
		if $fullpage.hasClass("initialized-fullpage")
			return
		$fullpage.addClass("initialized-fullpage")
		sections = [false, false, false, false, false]

		$('#fullpage').fullpage
			anchors: ['firstPage', 'secondPage', 'thirdPage', 'fourthPage'],
			afterLoad: (anchorLink, index) ->
				loadedSection = $(this)
				if !sections[0] && index == 1
					sections[0] = true
					setTimeout (->	
						$('.section-title-1').addClass('appeared')
					), 500
					setTimeout (->	
						$('.shadow-text-1').addClass('appeared')
					), 500
					setTimeout (->	
						$('.photo-left').addClass('appeared')
					), 1500
					setTimeout (->	
						$('.text-1').addClass('appeared')
					), 1500
				
				if !sections[1] && index == 2
					sections[1] = true
					setTimeout (->	
						$('.section-title-2').addClass('appeared')
					), 100
					setTimeout (->	
						$('.shadow-text-2').addClass('appeared')
					), 100
					setTimeout (->	
						$('.photo-right').addClass('appeared')
					), 1100
					setTimeout (->	
						$('.text-2').addClass('appeared')
					), 1100

				if !sections[2] && index == 3
					sections[2] = true
					setTimeout (->	
						$('.section-title-3').addClass('appeared')
					), 100
					setTimeout (->	
						$('.shadow-text-3').addClass('appeared')
					), 800
					setTimeout (->	
						$('.advantage-container').addClass('appeared')
					), 800
					setTimeout (->	
						$('.text-3').addClass('appeared')
					), 1600
					setTimeout (->
						$('.appear1, .appear2, .appear3, .appear4').addClass('appeared')
					), 2100

				if !sections[3] && index == 4
					sections[3] = true
					setTimeout (->	
						$('.section-title-4').addClass('appeared')
					), 100
					setTimeout (->	
						$('.shadow-text-4').addClass('appeared')
					), 100
					setTimeout (->	
						$('.form-container').addClass('appeared')
					), 1100
					setTimeout (->
						$('.door').addClass('appeared')
					), 1600

init_fp()
$(window).on('resize', init_fp)