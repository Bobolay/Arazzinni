alert('asd')
var scrolled = 0;
$(document).ready(function () {
    $("#arrow-downn").on("click", function () {
        scrolled = scrolled + 100;
        $(".scrolled-container").stop().animate({
            scrollTop: scrolled
        });
    });

    $("#arrow-upp").on("click", function () {
        scrolled = scrolled - 10000;
        $(".scrolled-container").stop().animate({
            scrollTop: scrolled
        });
    });

});