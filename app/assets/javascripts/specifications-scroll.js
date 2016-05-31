// var qwerty = $(".scrolled-container .text-block").css('line-height');
// var asdfg = $(".scrolled-container .text-block").css('padding');
$(function() {
   $("#arrow-up").click(function(){
      $('.scrolled-container').scrollTop($('.scrolled-container').scrollTop()-52);
  //        if ($('.scrolled-container').scrollTop()==0){
		// 	   		$("#arrow-up").addClass('faded')
		// 	   } else {
		// 	   		$("#arrow-up").removeClass('faded')
		// 	   }
  //        if ($('.scrolled-container').scrollTop()==$('.scrolled-container').outerHeight()+133) {
		// 	   		$("#arrow-down").addClass('faded')
		// 	   } else {
		// 	   		$("#arrow-down").removeClass('faded')
		// 	   }
		// console.log($('.scrolled-container').scrollTop())
		// console.log($('.scrolled-container').outerHeight())
 });

 $("#arrow-down").click(function(){
     $('.scrolled-container').scrollTop($('.scrolled-container').scrollTop()+52);
  //        if ($('.scrolled-container').scrollTop()==0){
		// 	   		$("#arrow-up").addClass('faded')
		// 	   } else {
		// 	   		$("#arrow-up").removeClass('faded')
		// 	   }
  //        if ($('.scrolled-container').scrollTop()==$('.scrolled-container').outerHeight()+133) {
		// 	   		$("#arrow-down").addClass('faded')
		// 	   } else {
		// 	   		$("#arrow-down").removeClass('faded')
		// 	   }
		// console.log($('.scrolled-container').scrollTop())
		// console.log($('.scrolled-container').outerHeight())
 }); 

});