$(function() {
  var $appeared = $('.appear1, .appear2, .appear3, .appear4, .appear5, .appear6, .appear7, .appear8, .appear9, .first-door, .second-door, .third-door');
  $appeared.appear();
  $(document.body).on('appear', function(e, $affected) {
    $affected.addClass('appeared')
  });
});