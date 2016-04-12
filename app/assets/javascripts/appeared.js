$(function() {
  var $appeared = $('.appear1,.appear2,.appear3,.appear4');
  $appeared.appear();

  $(document.body).on('appear', function(e, $affected) {
    $affected.addClass('appeared')
  });
});