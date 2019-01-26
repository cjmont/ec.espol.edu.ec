function buscarProspecto(id) {
	$.ajax({
			  url: "/detalle/getDetalleTemplate/1",
			  dataType: "json",
			  success: success
			}).done(function() {
  					console.log("listo");
			});
}
function success (data, textStatus, jqXHR) {
	console.log(data);
	$("#prospecto-titulo").html(data["nombre"]);
	$("#prospecto-img").attr("src",data["imagen"]);
	$("#detalle-custom-modal").removeClass("hidden");
	$("#detalle-custom-modal").addClass("show");
}