$("#enviar-btn").click(function () {
	if (verificarCampos()) {
		if (verificarCorreo() && verificarNumParticipante()) {
			$("#registro-form").submit();
			alert("Ingreso Exitoso")
		}
	} 
});

$(".requerido").keyup(function() {
	$(this).removeClass("vacio"); 
});

$("#participantes").blur(function(){
	var numero = $(this).val();
	if (numero <15) {
		alert("Ingrese minimo 15 participantes")
	}
});

function verificarCampos() {
	var bool = true;
	$(".requerido").each(function() {
		if ($(this).val() == "") {
			$(this).addClass("vacio");
			bool = false;
		}
	})
	if (!bool) {alert("Por favor llene los campos obligatorios.")}
	return bool;
}

function verificarCorreo() {
	var email = $("#email").val()
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  	if (!re.test(email)) {
  		alert(email)
		$("#email").addClass("vacio");
		alert("Por favor ingrese correctamente el correo.")
	}
  	return re.test(email);
}

function verificarNumParticipante(){
	var numero = parseInt($("#participantes").val());
	var bool = true;
	if (numero < 15) {
		bool = false;
		alert("El numero de participantes minimo es 15")
	}
	return bool;
}

//Funcion que valida que no se ingrese numero de celular invalido
function valida(e){
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8){
        return true;
    }

    patron =/[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}

$("#lugar").change(function (){
	if ( $(this).val() == "Otro" || $(this).val() == "Instalaciones de la empresa") {
		$("#campo-direccion").fadeIn("slow");
	}else{
		$("#campo-direccion").hide("1000");
	}
	
});