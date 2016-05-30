$(window).bind('mousewheel', function(e){
    
    var active = $('.door-one-wrapper .show-it');
    var next = active.next();
    var prev = active.prev();

    if(e.originalEvent.wheelDelta > 0)
    {
        active.addClass('go-down');
        setTimeout(function(){
        	active.removeClass('go-down');
        }, 500);
        setTimeout(function(){
        	active.removeClass('show-it');
        }, 500);
        setTimeout(function(){
        	prev.addClass('show-it');
        }, 500);
    }
    else
    {
        active.addClass('go-up');
        setTimeout(function(){
        	active.removeClass('go-up');
        }, 500);
        setTimeout(function(){
        	active.removeClass('show-it');
        }, 500);
        setTimeout(function(){
        	next.addClass('show-it');
        }, 500);
    }
});