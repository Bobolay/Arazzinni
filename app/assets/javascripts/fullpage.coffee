sections = [false, false, false, false, false]

$('#fullpage').fullpage
	anchors: ['firstPage', 'secondPage', 'thirdPage', 'fourthPage'],
	afterLoad: (anchorLink, index) ->
		loadedSection = $(this)
		if !sections[0] && index == 1
			sections[1] = true
			setTimeout (->	
				$('.section-title').addClass('appeared')
			), 200
			setTimeout (->	
				$('.shadow-text').addClass('left-to-right')
			), 300
			setTimeout (->	
				$('.photo-left').addClass('appeared')
			), 600
			setTimeout (->	
				$('.text').addClass('appeared')
			), 1000
		if !sections[1] && index == 2
			sections[1] = true
		if !sections[2] && index == 3
			sections[2] = true
		if !sections[3] && index == 4
			sections[3] = true
