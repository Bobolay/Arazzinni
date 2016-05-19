is_touch_screen = 'ontouchstart' in document.documentElement;
if (is_touch_screen && window.innerWidth < 640){
	console.log('works')
}
else {
	$(function() {
	  var $appeared = $('.appear1, .appear2, .appear3, .appear4, .first-door, .second-door, .third-door, .frame-left-right, .frame-right-left, .left-to-right-close, .left-to-right-far, .right-to-left-close, .right-to-left-far, .collection-one-wrapper .section-title, .collection-one-wrapper .shadow-text, .consultant-container .door, .consultant-container .form-container');
	  $appeared.appear();
	  $(document.body).on('appear', function(e, $affected) {
	    $affected.addClass('appeared')
	  });
	});
};