$(document).ready(function() {
  $('.review-tab').click(function(){
    console.log('yo');
    // Change active nav tab
    $('.review-tab').removeClass("active");
    $(this).addClass("active");

    // Change active container
    $('.review-container').removeClass("active");
    $($(this).data("target")).addClass("active");
  });
});

