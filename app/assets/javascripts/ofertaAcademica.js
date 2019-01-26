$(function () {
	setupOfertaAcademica();
	$(window).resize(function() {
		setupOfertaAcademica();
	});
});

function setupOfertaAcademica() {
	var anchoTotal = Math.floor($(window).width());
	var paddingAnchoTotal = Math.floor(($(window).width() - anchoTotal)/2);
	$(".oferta-main-container").css({
		"width" : anchoTotal,
		"margin-left" : paddingAnchoTotal,
		"margin-right" : paddingAnchoTotal
	});
	 $(".oferta-row-container").css({"margin":"0px"});
	var anchoRowTotal = $(".oferta-row-container").width();
	var espacioImg = 160;
	$(".oferta-img-container").css({
		"width" : espacioImg,
		"height" : "130px",
		"display" : "inline-block",
		"float" : "left"
	});
	$(".oferta-espacio-container").width(Math.floor(anchoRowTotal * 0.05));
	espacioImg = (espacioImg * 4);
	espacioImg += $(".oferta-espacio-container").width();
	var relleno = Math.floor((anchoRowTotal - espacioImg) / 2);
	$(".oferta-relleno-container").css({
		"width" : relleno
	});
}