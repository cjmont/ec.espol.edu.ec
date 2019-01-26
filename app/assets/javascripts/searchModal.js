$(function () {
	$("#search-btn").click(function () {
		start();
		$(".modal-backdrop").removeClass('modal-backdrop');
		$(".navbar-nav").css({"display" : "none"});
		estadoBtn.disabled = true;
	});
	/*$("#cerrar-search-modal").click(function () {
		$('.modal-dialog').modal('hide');
	});*/
	$("#contenedor-superior").click(function () {
		$('.modal-dialog').modal('hide');
		$(".navbar-nav").css({"display" : "block"});
	});
	
	$(".main-container").click(function () {
		$('.modal-dialog').modal('hide');
		$(".navbar-nav").css({"display" : "block"});
	});
	$('.modal-dialog').on('shown.bs.modal', function (e) {
		$('#search').focus();
	})
	$('.modal-dialog').on('hidden.bs.modal', function (e) {
		$("#search").val("");
		$("#search_result").html("");
	})
	$(window).resize(function () {
		searchModalSetup();
	});
});
function start() {
	searchModalSetup();
	$('.modal-dialog').modal('show');
	
}
function searchModalSetup() {
	$('#search-modal .modal-dialog').css({
		"margin-left" : $(window).width()/4,
		"margin-top" : $(window).height()/20,
		"width" : $(window).width()/2,
		"height" : "auto",
		"display": "inline-block"
	});
	$('#search-modal .modal-dialog .modal-content').css({
		"width" : $(window).width()/2,
		"height" : "auto"
	});
}