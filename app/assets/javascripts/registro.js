$("#enviar-btn").click(function () {
	if (verificarCampos()) {
		if (verificarCedula() && verificarFecha() && verificarCorreo()) {
			$("#registro-form").submit();
			$.ajax({
        	type : 'GET',
        	url : '/enviarCorreoConfirm',
        	data : {
            	"prospecto_nombre" : $("#prospecto_id").val()
	        },
        	dataType: 'JSON'
    		});
		}
	} 
});
$(".requerido").keyup(function() {
	$(this).removeClass("vacio");
})
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

function verificarCedula() {
	var bool = true;
	if ($("#tipo_id").val() == "CEDULA") {
		var cedula = $("#num_id").val()
		cedula = cedula.split("")
		bool = validarCedula(cedula)
	} 
	if (!bool) {
		alert("Por favor ingrese un número de cédula valido.")
		$("#num_id").addClass("vacio");
	}
	return bool;
}

function validarCedula(cedula) {
	try {
		//VERIFICAR 2 PRIMEROS DIGITOS SEAN 0 < X <= 24
		digitos = parseInt(cedula[0] + cedula[1])
		if (digitos <= 0 || digitos > 24) {return false}

		//VERIFICAR 3 DIGITO SEA MENOR A 6
		if (cedula[2] >= 6) {return false}

		//VERIFICAR MODULO 10
		var suma = 0
		for (var i=0; i<=8; i++) {
			var mult = parseInt(cedula[i])
			if (i%2 == 0) {mult = mult * 2}
			if (mult >= 10) {mult -= 9}
			suma += mult
		}
		techo = Math.ceil(suma / 10) * 10;
		comprobante = techo - suma
		if (comprobante != parseInt(cedula[9])) {return false}

		return true;
	} catch (err) {
		return false;
	}
}

function verificarFecha() {
	if ($("#prospecto_tipo").val() == "Landing Page") 
		return true
	else
	{
		var fecha = $("#fecha_nac").val()
		fecha = fecha.split("-")
		if (fecha[0].split("").length != 4) {
			alert("Por favor ingrese una fecha de nacimiento valida.")
			$("#fecha_nac").addClass("vacio");
			return false
		}
		try {
			fecha = new Date(fecha[1],fecha[1],fecha[2])
			if (fecha) {
				return true
			} else {
				alert("Por favor ingrese una fecha de nacimiento valida.")
				$("#fecha_nac").addClass("vacio");
				return false
			}
		} catch (err) {
			alert("Por favor ingrese una fecha de nacimiento valida.")
			$("#fecha_nac").addClass("vacio");
			return false
		}
	}
}

function verificarCorreo() {
	var email = $("#email").val()
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  	if (!re.test(email)) {
		alert("Por favor ingrese un email valido.")
		$("#email").addClass("vacio");
	}
  	return re.test(email);
}