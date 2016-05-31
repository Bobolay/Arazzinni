$(window).bind('mousewheel', function(e){
    var $active = $('.scrolled-block.active')
    if ($active.length == 0){
    	$active = $('.scrolled-block').first()
    }
    if(e.originalEvent.wheelDelta > 0)
    {
       	$target = $active.prev()
    }
    else
    {
        $target = $active.next()
    }
    if ($target.length){
    	$active.removeClass('active')
    	$target.addClass('active')
    	$target.ScrollTo({offsetTop: 80})
    }
});