jQuery(document).ready(function($){
  
  window.onload = function (){
    $(".bts-popup").delay(1000).addClass('is-visible');
  }
  
  //open popup
  $('.bts-popup-trigger').on('click', function(event){
    event.preventDefault();
    $('.bts-popup').addClass('is-visible');
  });
  
  //close popup
  $('.bts-popup').on('click', function(event){
    if( $(event.target).is('.bts-popup-close') || $(event.target).is('.bts-popup') ) {
      event.preventDefault();
      $(this).removeClass('is-visible');
    }
  });
  //close popup when clicking the esc keyboard button
  $(document).keyup(function(event){
      if(event.which=='27'){
        $('.bts-popup').removeClass('is-visible');
      }
    });
/*
  $(".accordion-ul").hover(function() {
      $(".accordion-li").hover(function() {
          $(this).width($(".accordion-img").width());
      });
      $(".accordion-li").mouseleave(function() {
          $(this).width("30%");
      });
  });
*/
});

function selectedImgSize () {
  var imgSize = $(".accordion-img").width();
  var ulSize = $(".accordion-ul").width();
  return (ulSize-imgSize);
}
function unselectedImgSize() {
  var selectedImgSize = selectedImgSize();
  var ulSize = $(".accordion-li").width();
  return (ulSize-selectedImgSize)
}

/*$(".telef").blur(function(){
  var numero = $(this).val();
    if ( numero.length != 10) {
      alert("Ingresar solo 10 digitos")
    }
});*/