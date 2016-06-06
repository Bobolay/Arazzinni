func = function(e){
    var $container = $(".block-container")

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
        image_height = 600
        frame_height = $('.big-frame').css('height')
        top = (image_height - frame_height ) / 2 * -1
        $('.scrolled-block').css("marginTop", top)
        $active.removeClass('active')
        $target.addClass('active')
        var $top = $target.offset().top
        var top_with_compensation = $top - $container.children().first().offset().top
        //$('.block-container').animate({scrollTop:$top})
        console.log('top:',top_with_compensation)

         $('.block-container').scrollTop(top_with_compensation)
    }
}

$(window).bind('mousewheel', function(e){
    delay("mousewheel", function(){
        func(e)
    }, 200)
});


$(document).ready(function(){
    $('.buy-button').on("click", function(){
        $('.step').first().addClass('current');
        $('.frame-carousel').owlCarousel({
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
    })

    $('.close-popup').on("click", function(){
        $('.step').parent().children().removeClass('current');
    })


    $('body').on('click', '.prev-step', function(){
        $prev_step = $('.step.current').prev()
        $('.step.current').removeClass('current')
        $prev_step.addClass('current')
    });
    $('body').on('click', '.next-step', function(){
        $next_step = $('.step.current').next()
        $('.step.current').removeClass('current')
        $next_step.addClass('current')
    });

    $choosen = $('.choose');
    $choosen.on('click', function(){
        $('.choose').removeClass("choosen");
        $(this).addClass('choosen');
    });
});