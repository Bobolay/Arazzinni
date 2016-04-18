sections = [false, false, false, false, false]

$('#fullpage').fullpage
	anchors: ['firstPage', 'secondPage', 'thirdPage', 'fourthPage'],
	afterLoad: (anchorLink, index) ->
		loadedSection = $(this)
		if !sections[0] && index == 1
			sections[0] = true
			setTimeout (->	
				$('.section-title-1').addClass('appeared')
			), 100
			setTimeout (->	
				$('.shadow-text-1').addClass('appeared')
			), 200
			setTimeout (->	
				$('.photo-left').addClass('appeared')
			), 600
			setTimeout (->	
				$('.text-1').addClass('appeared')
			), 700
		
		if !sections[1] && index == 2
			sections[1] = true
			setTimeout (->	
				$('.section-title-2').addClass('appeared')
			), 100
			setTimeout (->	
				$('.shadow-text-2').addClass('appeared')
			), 200
			setTimeout (->	
				$('.photo-right').addClass('appeared')
			), 600
			setTimeout (->	
				$('.text-2').addClass('appeared')
			), 700
		if !sections[2] && index == 3
			sections[2] = true
		if !sections[3] && index == 4
			sections[3] = true
