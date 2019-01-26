$(window).scroll(function(){
	//var i=document.getElementsByClassName('.row-mt-15em').style.position.top;
	var i= $('.flex-section').css("padding-top");
	//var d= $(window).height();
	//alert(i);

	//alert(i);

	if ( $(window).scrollTop() > 2)  {	
			
		$('.col-md-12').addClass('fadeInUp');
		$('.col-md-12').addClass('animated');
	} else {
		$('.col-md-12').removeClass('fadeInUp');
		$('.col-md-12').removeClass('animated');
	}

	if ( $(window).scrollTop() > 400)  {	
		$('.mision-titulo').addClass('bounceInDown');
		$('.mision-titulo').addClass('animated');
		$('.mision-titulo').removeClass('hide');
	} else {
		$('.mision-titulo').removeClass('bounceInDown');
		$('.mision-titulo').removeClass('animated');
		$('.mision-titulo').addClass('hide');
	}

	if ( $(window).scrollTop() > 500)  {	
		$('.mision-parrafo').addClass('bounceInDown');
		$('.mision-parrafo').addClass('animated');
		$('.mision-parrafo').removeClass('hide');
	} else {
		$('.mision-parrafo').removeClass('bounceInDown');
		$('.mision-parrafo').removeClass('animated');
		$('.mision-parrafo').addClass('hide');
	}

	if ( $(window).scrollTop() > 1000)  {	
		$('.learn').addClass('fadeInUp');
		$('.learn').addClass('animated-fast');
		$('.learn').removeClass('hide');
	} else {
		$('.learn').removeClass('fadeInUp');
		$('.learn').removeClass('animated-fast');
		$('.learn').addClass('hide');
	}

	if ( $(window).scrollTop() > 2400)  {	
		$('.politics').addClass('fadeInLeft');
		$('.politics').addClass('animated');
		$('.politics').removeClass('hide');
	} else {
		$('.politics').removeClass('fadeInLeft');
		$('.politics').removeClass('animated');
		$('.politics').addClass('hide');
	}

	if ( $(window).scrollTop() > 2600)  {	
		$('.feature-center').addClass('fadeInUp');
		$('.feature-center').addClass('animated');
		//$('.feature-center').removeClass('hide');
	} else {
		$('.feature-center').removeClass('fadeInUp');
		$('.feature-center').removeClass('animated');
		//$('.feature-center').addClass('hide');
	}

	if ( $(window).scrollTop() > 3000)  {	
		$('.politicas-1').addClass('fadeInUp');
		$('.politicas-1').addClass('animated');
		//$('.politicas-1').removeClass('hide');
	} else {
		$('.politicas-1').removeClass('fadeInUp');
		$('.politicas-1').removeClass('animated');
		//$('.politicas-1').addClass('hide');
	}

});	




