$(function() {
   $("#arrow-up").click(function(){
      $('.scrolled-container').scrollTop($('.scrolled-container').scrollTop()-52);
 });

	 $("#arrow-down").click(function(){
	     $('.scrolled-container').scrollTop($('.scrolled-container').scrollTop()+52);
	 });
});