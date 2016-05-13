$(function() {
  var $appeared = $('.appear1, .appear2, .appear3, .appear4, .first-door, .second-door, .third-door, .frame-left-right, .frame-right-left, .left-to-right-close, .left-to-right-far, .right-to-left-close, .right-to-left-far');
  $appeared.appear();
  $(document.body).on('appear', function(e, $affected) {
    $affected.addClass('appeared')
  });
});