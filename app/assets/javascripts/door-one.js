var block_height = $('.scrolled-block').height()
var container_height = $('.scroll-container').height()
var top_margin = (container_height-block_height )/2
$('.scrolled-block').css("marginTop", top_margin)

func = function(direction){
    var $container = $(".block-container")

    var $active = $('.scrolled-block.active')
    var $link = $('li.active')
    if ($active.length == 0){
        $active = $('.scrolled-block').first()
    }
    if(direction)
    {
           $target = $active.prev()
           if ($link.prev().length)
               $link.removeClass('active')
               $link.prev().addClass('active')
    }
    else
    {
        $target = $active.next()
        if ($link.next().length)
            $link.removeClass('active')
            $link.next().addClass('active')
    }
    if ($target.length){
        $active.removeClass('active')
        $target.addClass('active')
        var $top = $target.offset().top
        var top_with_compensation = $top - $container.children().first().offset().top
        $('.block-container').animate({scrollTop:top_with_compensation})
         // $('.block-container').scrollTop(top_with_compensation)
    }
}

$('.mobile-nav-container, .side-nav-container').on("click", "li", function(){
    $(this).parent().children().removeClass('active')
    $(this).addClass('active')

    $container = $(this).closest('.door-one-wrapper')
    var $i = $(this).index();
    $container.find(".block-container").children().removeClass("active")
    $container.find(".scrolled-block").eq($i).addClass("active")
    
    $target = $(".scrolled-block.active")
    var $top = $target.offset().top
    var top_with_compensation = $top - $(".block-container").children().first().offset().top
    $('.block-container').animate({scrollTop:top_with_compensation})

});


$(window).bind('mousewheel', function(e){
    delay("mousewheel", function(){
        // delta = e.originalEvent.hasOwnProperty("wheelDelta") ? e.originalEvent.wheelDelta : e.originalEvent.detail * -1
        var delta = e.deltaY
        func(delta > 0)
    }, 200)
});
