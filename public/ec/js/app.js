var i = -1;
var j = -1;
var k = -1;
var l = -1;
var contCurso = -1;
var contProg = -1;
var contDiplo = -1;

try {
var btnEnviar = document.getElementById('btn_submit');
var modal = document.getElementById('myModal');
var span = document.getElementsByClassName("close")[0];

btnEnviar.addEventListener("click", cargarDatos);
}catch(err){

}


function cargarCurso(variable){
    localStorage.setItem("curso", variable);
    //console.log(localStorage.getItem("curso"));
}

function cargarEvento(variable){
    localStorage.setItem("evento", variable);
    //console.log(localStorage.getItem("evento"));
}

function cargarNoticia(variable){
    localStorage.setItem("noticia", variable);
    //console.log(localStorage.getItem("noticia"));
}

window.onload = function() {
    cargarCurso(1);
    cargarNoticia(1);
};





fetch('http://ec.espol.edu.ec/api/noticia')
        .then((arregloNoticias) => {
            return arregloNoticias.json();
        } ).then((arregloNoticias) => {

            arregloNoticias.noticias.forEach(function(objeto) {
                j++;
                //console.log(objeto)

                if (objeto.tipo === "newsletter"){
                    objeto.articulos.forEach(function(article) {
                        k++;
                        $("#todosInfoec").append('<article class="blog_item heading_space wow fadeInLeft" data-wow-delay="300ms"><div class="row"><div class="col-md-5 col-sm-5 heading_space"><div class="image"><img id="imagenNoticia'+k+'" src="" alt="blog" class="border_radius"></div></div><div class="col-md-7 col-sm-7 heading_space"><h3 id="tituloNoticia'+k+'"></h3><ul class="comment margin10"><li><a href="#." id="fechaNoticia'+k+'"></a></li></ul><p id="contenidoNoticia'+k+'" class="margin10"></p><a onclick="cargarNoticia('+k+')" id="botonNoticia'+k+'" class=" btn_common btn_border margin10 border_radius" href="blog_detail.html">Ver más</a></div></div></article>')

                        

                        try {
                        document.getElementById('fechaNoticia' + k).innerHTML = objeto.publicacion;
                        document.getElementById('tituloNoticia' + k).innerHTML = article.titulo;
                        document.getElementById('contenidoNoticia' + k).innerHTML = article.contenido;
                        document.getElementById('imagenNoticia' + k).src = "http://www.ec.espol.edu.ec" + article.imagen;
                        console.log("http://www.ec.espol.edu.ec" + article.imagen)

                        }catch(err){
                            //console.log(err);
                        }

                        

                    })

                    


                } else {

                    //console.log("Este era un newsletter: " + objeto)

                    objeto.articulos.forEach(function(article) {
                        k++;
                        $("#todasNoticias").append('<article class="blog_item heading_space wow fadeInLeft" data-wow-delay="300ms"><div class="row"><div class="col-md-5 col-sm-5 heading_space"><div class="image"><img id="imagenNoticia'+k+'" src="" alt="blog" class="border_radius"></div></div><div class="col-md-7 col-sm-7 heading_space"><h3 id="tituloNoticia'+k+'"></h3><ul class="comment margin10"><li><a href="#." id="fechaNoticia'+k+'"></a></li></ul><p id="contenidoNoticia'+k+'" class="margin10"></p><a onclick="cargarNoticia('+k+')" id="botonNoticia'+k+'" class=" btn_common btn_border margin10 border_radius" href="blog_detail.html">Ver más</a></div></div></article>')
                        //console.log(article.titulo);

                        try {
                            document.getElementById('fechaNoticia' + k).innerHTML = objeto.publicacion;
                            document.getElementById('tituloNoticia' + k).innerHTML = article.titulo;
                            document.getElementById('contenidoNoticia' + k).innerHTML = article.contenido;
                            document.getElementById('imagenNoticia' + k).src = "http://www.ec.espol.edu.ec" + article.imagen;

                        }catch(err){
                            
                        }
                        if (k > 7){

                            $(".owl-wrapper").append('<div class="owl-item" style="width:375px;"><div class="item"><div class="content_wrap"><div class="image"><img id="imagenNoticiaSlider'+k+'" src="" alt="Edua" class="img-responsive border_radius"></div><div class="news_box border_radius"><h4><a onclick="cargarNoticia('+k+')" id="tituloNoticiaSlider'+k+'"></a></h4><ul class="commment"></ul><p id="contenidoNoticiaSlider'+k+'"></p><a onclick="cargarNoticia('+k+')" id="botonNoticiaSlider'+k+'" class=" btn_common btn_border margin10 border_radius" href="blog_detail.html">Ver más</a></div></div></div></div>')
                            try {
                            document.getElementById('imagenNoticiaSlider' +k).src = "http://www.ec.espol.edu.ec" + article.imagen;
                            document.getElementById('tituloNoticiaSlider' + k).innerHTML = article.titulo;
                            document.getElementById('contenidoNoticiaSlider' + k).innerHTML= article.contenido.slice(0, 80) ;
                            }catch(err){
                                //console.log(err);
                            }
                        }

                    })

                    

                }
                
                


            });
        });





          
            
              
            
            
              
              
                
              
              
              
              
            
          
        



fetch('http://ec.espol.edu.ec/api/prospecto')
        .then((arregloProspectos) => {
            return arregloProspectos.json();
        } ).then((arregloProspectos) => {

            arregloProspectos.prospectos.forEach(function(objeto) {
            i++;

                
                if (objeto.tipo === "Curso"){

                    //console.log(objeto.tipo);

                    $("#todosCursos").append('<div class="col-sm-6 col-md-4"><div class="course margin_top wow fadeIn" data-wow-delay="400ms"><div class="image bottom25"><img id="imagenCurso'+i+'" src="" alt="Course" class="border_radius"></div><h3 class="bottom10" id="nombreCurso'+i+'"><a href="course_detail.html"></a></h3><p class="bottom20" id="descripcionCurso'+i+'"></p><a onclick="cargarCurso('+objeto.id+')" id="botonCurso'+i+'" class="btn_common yellow border_radius" href="course_detail.html">Ver más</a></div></div>');
                    
                    try {
                        document.getElementById('imagenCurso' + i).src = "http://www.ec.espol.edu.ec" + objeto.imagen;
                        document.getElementById('nombreCurso' + i).innerHTML = objeto.nombre.slice(0,30);
                        document.getElementById('descripcionCurso' + i).innerHTML = objeto.contenido.objetivo.slice(0,85);
                    }
                    catch(err) {
                        //console.log(err.message);
                    }


                    
                }else if (objeto.tipo === "Programa"){

                    //console.log("En programa" + objeto.tipo);

                    $("#todosProgramas").append('<div class="col-sm-6 col-md-4"><div class="course margin_top wow fadeIn" data-wow-delay="400ms"><div class="image bottom25"><img id="imagenPrograma'+i+'" src="" alt="Course" class="border_radius"></div><h3 class="bottom10" id="nombrePrograma'+i+'"><a href="course_detail.html"></a></h3><p class="bottom20" id="descripcionPrograma'+i+'"></p><a onclick="cargarCurso('+objeto.id+')" id="botonPrograma'+i+'" class="btn_common yellow border_radius" href="course_detail.html">Ver más</a></div></div>');
                    
                    try {
                        document.getElementById('imagenPrograma' + i).src = "http://www.ec.espol.edu.ec" + objeto.imagen;
                        document.getElementById('nombrePrograma' + i).innerHTML = objeto.nombre.slice(0,30);
                        document.getElementById('descripcionPrograma' + i).innerHTML = objeto.contenido.objetivo.slice(0,85);
                    }
                    catch(err) {
                        //console.log(err.message);
                    }


                    
                }else if (objeto.tipo === "Diplomado"){

                    //console.log("En diplomado" + objeto.tipo);

                    $("#todosDiplomados").append('<div class="col-sm-6 col-md-4"><div class="course margin_top wow fadeIn" data-wow-delay="400ms"><div class="image bottom25"><img id="imagenDiplomado'+i+'" src="" alt="Course" class="border_radius"></div><h3 class="bottom10" id="nombreDiplomado'+i+'"><a href="course_detail.html"></a></h3><p class="bottom20" id="descripcionDiplomado'+i+'"></p><a onclick="cargarCurso('+objeto.id+')" id="botonDiplomado'+i+'" class="btn_common yellow border_radius" href="course_detail.html">Ver más</a></div></div>');
                    
                    try {
                        document.getElementById('imagenDiplomado' + i).src = "http://www.ec.espol.edu.ec" + objeto.imagen;
                        document.getElementById('nombreDiplomado' + i).innerHTML = objeto.nombre.slice(0,30);
                        document.getElementById('descripcionDiplomado' + i).innerHTML = objeto.contenido.objetivo.slice(0,85);
                    }
                    catch(err) {
                        //console.log(err.message);
                    }


                    
                }







            });

        })







fetch('http://cec.espol.edu.ec/api/evento')
        .then((arregloEventos) => {
            return arregloEventos.json();
        } ).then((arregloEventos) => {

            arregloEventos.eventos.forEach(function(objeto) {
            l++;
            //console.log(objeto);
            //console.log(arregloEventos);
            //console.log(arregloEventos.eventos);
                
                if (objeto.contenido[0].prospecto[0].tipo === "Curso"){
                    contCurso++
                    if (contCurso < 3){
                        $(".indexCursos").append('<a class="chooseEvent" onclick="cargarCurso('+objeto.contenido[0].prospecto[0].id+')" href="course_detail.html"><li id="idC'+l+'" class="pricing_feature"></li></a>');
                        try{
                        document.getElementById('idC' + l).innerHTML = objeto.contenido[0].prospecto[0].nombre;
                        //console.log(objeto.contenido[0].prospecto[0].nombre);
                        }catch(err){}
                    }
                    
                    
                }else if (objeto.contenido[0].prospecto[0].tipo === "Programa"){
                    contProg++
                    if (contProg < 3){
                        $(".indexProgramas").append('<a class="chooseEvent" onclick="cargarCurso('+objeto.contenido[0].prospecto[0].id+')" href="course_detail.html"><li id="idP'+l+'" class="pricing_feature"></li></a>');
                        try{
                        document.getElementById('idP' + l).innerHTML = objeto.contenido[0].prospecto[0].nombre;
                        //console.log(objeto.contenido[0].prospecto[0].nombre);
                        }catch(err){}
                    }

                    
                }else if (objeto.contenido[0].prospecto[0].tipo === "Diplomado"){
                    contDiplo++
                    if (contDiplo < 3){
                        $(".indexDiplomados").append('<a class="chooseEvent" onclick="cargarCurso('+objeto.contenido[0].prospecto[0].id+')" href="course_detail.html"><li id="idD'+l+'" class="pricing_feature"></li></a>');
                        try{
                        document.getElementById('idD' + l).innerHTML = objeto.contenido[0].prospecto[0].nombre;
                        //console.log(objeto.contenido[0].prospecto[0].nombre);
                        }catch(err){}
                    }
                
                }






 
            });

        })

   







class Contacto {
    constructor(nombre, email, telefono, mensaje){
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.mensaje = mensaje;
    }
}

function cargarDatos () {
    var nombre = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var telefono = document.getElementById('celular').value;
    var mensaje = document.getElementById('message').value;
    var contacto_tmp = new Contacto(nombre, email, telefono, mensaje);

    console.log(contacto_tmp);

    fetch('http://cec.espol.edu.ec/api/usuariospost', {
      method: 'post',
      headers: {
        'Accept': 'application/json, text/plain, */*',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(contacto_tmp)
    }).then(res=>res.json())
      .then(res => console.log(res));


    modal.style.display = "block";
    span.onclick = function() {
        modal.style.display = "none";
        document.getElementById('name').value = "";
        document.getElementById('email').value = "";
        document.getElementById('celular').value = "";
        document.getElementById('message').value = "";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }

        document.getElementById('name').value = "";
        document.getElementById('email').value = "";
        document.getElementById('celular').value = "";
        document.getElementById('message').value = "";
    }


}


