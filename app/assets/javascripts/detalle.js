//          MODAL FUNCTIONS
$("#subs-btn").click(function() {
    deshabilitandoBotonDescargar();
    $.ajax({
        type : 'GET',
        url : '/verificarSesion',
        data : {
            "prospecto_nombre" : $("#prospecto_id").val()            
        },
        success : verificarSesionResponse,
        dataType: 'JSON'
    });
});

$("#video-btn").click(function() {
    $("#video-field").attr('video',true)
    $("#tituloDescargarModal-h3").html("PARA VER LA CHARLA INICIA SESIÓN")
    $("#descargar-modal").css({"display":"block"});
    setTimeout(function () {
        $("#descargar-modal-content").addClass("fadeIn");
    }, 100);
});

$("#registrarte-btn").click(function() {
    $("#registrarte-btn").prop('disabled', true)
    $("#confirmar-modal").css({"display":"block"});
    $("#confirmar-modal-content").css({"opacity:":"1"});
        setTimeout(function () {
            $("#descargar-modal-content").addClass("fadeIn");
        }, 100);
});

$("#si-btn").click(function() {
    $("#confirmar-modal").css({"display":"none"});
    $("#registrarte-btn").prop('disabled', true);
    $("#registro").attr('value',true)
    $.ajax({
        type : 'GET',
        url : '/verificarSesion',
        data : {
            "prospecto_nombre" : $("#prospecto_id").val(),
            "evento" : $("#registrarte-btn").attr("evento"),
            "registro" : true
        },
        success : verificarSesionResponse,
        dataType: 'JSON'
    });
});

$("#no-btn").click(function() {
    $("#confirmar-modal").css({"display":"none"});
    $("#registrarte-btn").prop('disabled', false)
});
function verificarSesionResponse(data, textStatus, jqXHR) {
    habilitarBotonDescargar();
    if (data["response"] == "ERROR") {
        if (data["origen"]) {
            $("#registro-field").attr('registro',true)
            $("#tituloDescargarModal-h3").html("PARA REGISTRARTE INICIA SESIÓN")
        } else {
            $("#registro-field").attr('registro',false)
            $("#tituloDescargarModal-h3").html("PARA DESCARGAR EL CONTENIDO INICIA SESIÓN")
        }
        $("#descargar-modal").css({"display":"block"});
        setTimeout(function () {
            $("#descargar-modal-content").addClass("fadeIn");
        }, 100);
    } else if (data["response"] == "USUARIO_REGISTRADO") {
        cuadroAvisoRegistrado();
        $.ajax({
            type : 'GET',
            url : '/enviarCorreoConfirm',
            data : {
            },
            dataType: 'JSON'
        });
    } else {
        showConfirmacion(data); 
    }
    
    //Habilitando boton de registro
    $("#registrarte-btn").html("Regístrate aquí")
    $("#registrarte-btn").prop('disabled', false)
    
}
$("#descargar-modal-closeBtn").click(function() {
    $("#descargar-modal").css({"display":"none"});
    $("#descargar-modal-content").removeClass("fadeIn");
    habilitarBotonDescargar()
    habilitarBotonIniciarSesion();
});

$("#confirmacion-modal-closeBtn").click(function() {
    $("#confirmacion-modal").css({"display":"none"});
    $("#confirmacion-modal-content").removeClass("fadeIn");
    habilitarBotonDescargar()
    habilitarBotonIniciarSesion();
});
$("#confirmar-modal-closeBtn").click(function() {
    $("#confirmar-modal").css({"display":"none"});
    $("#confirmar-modal-content").removeClass("fadeIn");
     $("#registrarte-btn").prop('disabled', false)
    habilitarBotonDescargar();
    habilitarBotonIniciarSesion();
});
$("#confirmacion-modal-okButton").click(function() {
    $("#confirmacion-modal").css({"display":"none"});
    $("#confirmacion-modal-content").removeClass("fadeIn");
    habilitarBotonDescargar()
    habilitarBotonIniciarSesion();
});

//          INICIAR SESION
$("#login-btn").click(function() {
    if (verificarCampos() == true ) {
        if ($("#modal-email").val() != "" && $("#modal-cedula").val() != "") {
            deshabilitandoBotonDescargar();
            deshabilitandoBotonIniciarSesion();
            var data_ = {
                "email" : $("#modal-email").val(),
                "cedula" : $("#modal-cedula").val(),
                "prospecto_nombre" : $("#prospecto_id").val(),
                authenticity_token: $("#authenticity_token").val()
            }
            if (verificarOrigenRegistro()) {
                data_["registro"] = true
                data_["evento"] = $("#registrarte-btn").attr("evento")
            }else if(verificarOrigenVideo()){
                 data_["webinario"] = true
                 data_["evento"] = $("#video-btn").attr("evento")
                 data_["url_video"] = $("#url_video").attr("url_video")
            }    
            $.ajax({
                type : 'POST',
                url : '/iniciarSesion',
                data : data_,
                success : iniciarSesionResponse,
                dataType: 'JSON'
            });
        }
    }
});

function iniciarWebinar(){
    $("#descargar-modal").css({"display":"none"});
    var fechaEvento = $("#prospecto_fecha").val();
    validarFecha(fechaEvento);
}

function validarFecha(fechaEvento){
    var res = fechaANum(fechaEvento);
    var hm = res[5].split(":");
    var fechaHoy = hoyFecha();
    
    if (res[0]>=fechaHoy[0] && res[2]>=fechaHoy[1] && res[4]>=fechaHoy[2]
     && hm[0]>=fechaHoy[3]) {
        mostrarVideo();
    }else{
        mostrarVideo();
        /*mensaje indicando que no es la fecha del webinario*/
    }
}

function mostrarBtnCharla(fechaEvento){
    var res = fechaANum(fechaEvento);
    var hm = res[5].split(":");
    var fechaHoy = hoyFecha();
    
    if (res[0]>=fechaHoy[0] && res[2]>=fechaHoy[1] && res[4]>=fechaHoy[2]
     && hm[0]>=fechaHoy[3]) {
        mostrarVideo();
    }else{
        /*mensaje indicando que no es la fecha del webinario*/
    }
}

function fechaANum(fechaEvento) {
    //separa la fecha del evento
    var res = fechaEvento.split(" ");
    res[2] = mesCambioFormato(res[2]);
    return res;
}

function hoyFecha(){
    var hoy = new Date();
    var dd = hoy.getDate();
    var mm = hoy.getMonth()+1;
    var yyyy = hoy.getFullYear();
    var hh = hoy.getHours();
    var nn = hoy.getMinutes();
    dd = addZero(dd);
    mm = addZero(mm);
    var fecha = dd+' '+mm+' '+yyyy+' '+hh+' '+nn;
    fecha = fecha.split(" ");
    return fecha;
}

function mesCambioFormato(mm){
    switch (mm) {
    case "Enero":
        mm = 1;
        break;
    case "Febrero":
        mm = 2;
        break;
    case "Marzo":
        mm = 3;
        break;
    case "Abril":
        mm = 4;
        break;
    case "Mayo":
        mm = 5;
        break;
    case "Junio":
        mm = 6;
        break;
    case "Julio":
        mm = 7;
        break;
    case "Agosto":
        mm = 8;
        break;
    case "Septiembre":
        mm = 9;
        break;
    case "Octubre":
        mm = 10;
        break;
    case "Noviembre":
        mm = 11;
        break;
    case "Diciembre":
        mm = 12;
        break;
    }
    mm = addZero(mm);
    return mm;
}

function addZero(i) {
    if (i < 10) {
        i = '0' + i;
    }
    return i;
}

function mostrarVideo(){
    $("#modal-video").css({"display":"inline"});
    agregarVideo();
}
function cerrarVideo(){
    $("#modal-video").css({"display":"none"});
    $("#frame-video").remove();
}
function agregarVideo(){
    var scrollTop = $(window).scrollTop();
    var strScroll = scrollTop.toString();
    var video_url=document.getElementById("url_video").value;
    var videoEnlace = '<iframe id="frame-video" width="560" height="315" src="'+video_url+'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
    var videoChat = '<iframe scrolling="no" src="http://200.10.147.137:8081/" frameborder="0" width="560" height="430"></iframe>';
    document.getElementById('video-play').innerHTML= videoEnlace;
    document.getElementById('video-chat').innerHTML= videoChat;
    document.getElementById("sub_ventana").style.margintop= "200px";
}

function verificarCampos() {
    var bool = true;
    $(".requerido").each(function() {
        if ($(this).val() == "") {
            $(this).addClass("vacio");
            bool = false;
        }
    })
    if (!bool) {alert("Por favor llene los campos ")}
    return bool;
}


$(".requerido").keyup(function() {
    $(this).removeClass("vacio"); 
});

function iniciarSesionResponse(data, textStatus, jqXHR) {
    $("#mensajeErrorLogin-h3").css({"display":"none"})
    if (data["response"] == "OK") {
        $("#descargar-modal").css({"display":"none"});
        $("#descargar-modal-content").removeClass("fadeIn");
        showConfirmacion(data);        
    } else if (data["response"] == "USUARIO_REGISTRADO") {
        $("#descargar-modal").fadeOut();
        cuadroAvisoRegistrado();
    } else if (data["response"] == "USUARIO_EXISTE"){
        $("#descargar-modal").fadeOut();
        cuadroAvisoRegistrado();
    } else if (data["response"] == "USUARIO_ENCONTRADO"){
        iniciarWebinar();
    } else if (data["response"] == "USUARIO_NoENCONTRADO"){
        $("#mensajeErrorLogin-h3").css({"display":"block"})
        $("#mensajeErrorLogin-h3").html("Usted no se encuentra registrado en esta charla.")
    } else {
        $("#mensajeErrorLogin-h3").css({"display":"block"})
        $("#mensajeErrorLogin-h3").html("Email o cédula incorrecta.")
    }
    //CLEAR INPUTS
    $("#modal-email").val("")
    $("#modal-cedula").val("")

    habilitarBotonDescargar();
    habilitarBotonIniciarSesion();
}

function verificarOrigenRegistro() {
    if ($("#registro-field").attr('registro') == "true") {
        return true;
    }
    return false;
}

function verificarOrigenVideo() {
    if ($("#video-field").attr('video') == "true") {
        return true;
    }
    return false;
}


function showConfirmacion(data) {
    $("#confirmacion-modal").css({"display" : "block"});
    $("#correoDeUsuario").html(data["emailDeUsuario"]);
    $("#usuario_id").val(data["idUsuario"]);
    setTimeout(function () {
        $("#confirmacion-modal-content").addClass("fadeIn");
    }, 100);
}

function deshabilitandoBotonDescargar() {
    $("#subs-btn").html("Enviando...");
    $("#subs-btn").prop('disabled', true);
}

function habilitarBotonDescargar() {
    $("#subs-btn").html("Descargar Contenido");
    $("#subs-btn").prop('disabled', false);
}

function deshabilitandoBotonIniciarSesion() {
    $("#login-btn").html("Procesando...");
    $("#login-btn").prop('disabled', true);
}

function habilitarBotonIniciarSesion() {
    $("#login-btn").html("Iniciar Sesión");
    $("#login-btn").prop('disabled', false);
}

//          VER POLITICAS DE CURSO

$("#subs-btn-ver").click(function() {
    showPolitica();
    deshabilitandoBotonVer();
});

function deshabilitandoBotonVer() {
    $("#subs-btn-ver").prop('disabled', true);
}

function showPolitica() {
    $("#politica").css({"display" : "block"});
    setTimeout(function () {
        $("#politica-contenedor").addClass("mostrar");
    }, 100);
}

$("#politica-closeBtn").click(function() {
    $("#politica").css({"display":"none"});
    $("#politica-contenedor").removeClass("mostrar");
    habilitarBotonVerPoliticas();
});

function habilitarBotonVerPoliticas() {
    $("#subs-btn-ver").prop('disabled', false);
}

// FUNCION PARA EL CUADRO DE CONFIRMACION DE REGISTRO
function cuadroNotificar(){
    var valor = $("#mensaje-registro").val();
    if (valor == "true") {
        $("#spam-notificar").html("<div id='spam-notificar-correcto' class='alert alert-success'> Se registro correctamente</div> ");
        $("#basico").addClass("cuadro-notificar-correcto");
        aparecerCuadroNotificar(".cuadro-notificar-correcto");
        setTimeout(desaparecerCuadroNotificar(".cuadro-notificar-correcto"),20000);

    }else if(valor == "false"){
        /*$("#spam-notificar").html("<div id='spam-notificar-no-correcto'  class='alert alert-danger'> No se registro correctamente </div> ");
        $("#basico").addClass("cuadro-notificar-no-correcto");
        aparecerCuadroNotificar(".cuadro-notificar-no-correcto");
        setTimeout(desaparecerCuadroNotificar(".cuadro-notificar-no-correcto"),20000);*/
    }
}
// ============FIN============


//FUNCION PARA AVISO DE USUARIO REGISTRADO
function cuadroAvisoRegistrado(){
    
    $("#mensaje-confirmacion").addClass("visible");
    aparecerCuadroNotificar("#mensaje-confirmacion");
    setTimeout(desaparecerCuadroNotificar("#mensaje-confirmacion"),9000);
    $("#mensaje-confirmacion").removeClass("visible");
}

function cuadroAvisoExiste(){
    
    $("#mensaje-existe").addClass("visible");
    aparecerCuadroNotificar("#mensaje-existe");
    setTimeout(desaparecerCuadroNotificar("#mensaje-existe"),9000);
    $("#mensaje-existe").removeClass("visible");
}

function aparecerCuadroNotificar(nombreClass){
    $(nombreClass).fadeIn("slow");
}

function desaparecerCuadroNotificar(nombreClass){
    $(nombreClass).fadeOut(4000);
}

$(document).ready(function(){
    cuadroNotificar();
});