$(document).ready(function(){
  $(".button .btn-open").click(function(){
    $(".overlay").fadeToggle(200);
  });
});
$('.overlay').on('click', function(){
  $(".overlay").fadeToggle(200);
  open = false;
});
