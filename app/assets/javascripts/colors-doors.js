$('.door-colors-container').on("click", ".color-block", function(){
	$container = $(this).closest('.door-show, .block-container')
	var $i = $(this).index();
	$container.find(".door-image-container").children().removeClass("visible")
	$container.find(".door-image").eq($i).addClass("visible")
});

$('.pick-colors').on("click", ".color", function(event){
	// event.stopPropagation();
	event.preventDefault();
	$container = $(this).closest('.frame')
	var $i = $(this).index();
	$container.find(".door").removeClass("show-it")
	$container.find(".door").eq($i).addClass("show-it")
});

$('.pick-colors').on("click", ".color", function(){
	$container = $(this).closest('.unit-container')
	var $i = $(this).index();
	$container.find(".hardware-img").removeClass("show-it")
	$container.find(".hardware-img").eq($i).addClass("show-it")
});