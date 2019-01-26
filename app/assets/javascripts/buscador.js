$(function() {
	$("#search").keyup(function() {
		var filter = $("#search").val();
		$.ajax({
				type : 'GET',
				url : '/search/' + filter,
				success : exito,
				dataType: 'json'
			});
	});
});

function exito(data, textStatus, jqXHR) {
	$("#search_result").html("");
	if (data["prospectos"].length > 0) {
		var prospectos = data["prospectos"];
		for (index in prospectos) {
			addButton(prospectos[index]["nombre"],"Prospecto",prospectos[index]["id"]);
		}
	}
	setHover();
	//setClickOnResults();
}

function addButton(text,tipo,id) {
	var res = text.replace(/[ ]/gi,'-');
	var btn = $("<button></button>");
	var form = $("<form></form>");
	form.attr("action","/detalle/"+res);
	btn.attr("class","form-control");
	btn.attr("type","submit");
	btn.attr("tipo",tipo);
	btn.attr("value",id);
	btn.css({
		"height": "auto",
		"text-align" : "left",
		"background-color" : "white",
		"padding-left" : "15px",
		"width" : $("#search").width() + 32
	});
	btn.html(text);
	form.html(btn);
	$("#search_result").append(form);
}

function setHover () {
	$('#search_result button').hover(function (self) {
		$(this).focus();
	});
}

