change_slide = (index)->

	$(".product-unit-on-banner").children().removeClass("visible")
	setTimeout(
			()->
				$(".unit#{index + 1}").addClass("visible")
			300
		)

$("body").on "click", ".product-unit-on-banner .squares a", ()->
    $button = (this)
    index = $button.index
    change_slide()

$(document).ready ->
  $('.bxslider').bxSlider
    pagerCustom: '#bx-pager'
    controls: false
    infiniteLoop: false
    hideControlOnEnd: true
    speed: 1000
    pause: 10000
    auto: true
    infiniteLoop: true
    onSlideBefore: (element, oldIndex, newIndex)->
        change_slide(newIndex)

$(document).ready ->
  $('.bxslider').bxSlider
    pagerCustom: '#bx-pager'
    controls: false
    infiniteLoop: false
    hideControlOnEnd: true
    speed: 1000
    pause: 10000
    auto: true
    infiniteLoop: true
    onSlideBefore: (element, oldIndex, newIndex)->
        change_slide(newIndex)

$(document).ready ->
    slider = $('.bxslider-door').bxSlider
        pagerCustom: '#bx-pager'
        controls: false
        infiniteLoop: false
        hideControlOnEnd: true
        speed: 1000
        pause: 10000
        auto: true
        infiniteLoop: true
        onSlideBefore: (element, oldIndex, newIndex)->
            change_slide(newIndex)
    $('.door-slider-arrow-left').click ->
      current = slider.getCurrentSlide()
      slider.goToPrevSlide(current) - 1
    $('.door-slider-arrow-right').click ->
      current = slider.getCurrentSlide()
      slider.goToNextSlide(current) + 1