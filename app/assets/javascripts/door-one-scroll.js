// $(window).bind('mousewheel', function(e){
//     if(e.originalEvent.wheelDelta > 0) {
//         console.log('up')
//         var next;
//         if (next === undefined) {
//             next = $('.scrolled-block').next();
//         } else {
//             if (prev === undefined) {
//                 next = next.next();
//             } else {
//                 next = prev.next();
//                     prev = undefined;
//             }
//         }
//         $(".block-container").scrollTo(next, 800, {
//             margin: true
//         });
//     } else {
//         console.log('down')
//         var prev;
//         if (prev === undefined) {
//             if (next === undefined) {
//                 prev = $('.scrolled-block').prev();
//             } else {
//                 prev = next.prev();
//             }
//         } else {
//             prev = prev.prev();
//         }
//         $(".block-container").scrollTo(prev, 800, {
//             margin: true
//         });
//     };
// });



$(window).bind('mousewheel', function(e){
    if(e.originalEvent.wheelDelta > 0)
    {
        $('.scrolled-block').prev().ScrollTo();
    }
    else
    {
        $('.scrolled-block').next().ScrollTo();
    }
});

// $(window).bind('mousewheel', function(e){
//     var $current = $('.scrolled-block');
//     var $prev = $current.prev();
//     var $next = $current.next();
//     if(e.originalEvent.wheelDelta > 0)
//     {
//         $('.block-container').animate({
//             scrollTop: $prev.offset().top
//         })
//     }
//     else
//     {
//         $('.block-container').animate({
//             scrollTop: $prev.offset().top
//         })
//     }
// });