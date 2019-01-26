var x = -1;

//console.log("Entramos a Noticias");

var noticiaSeleccionada = localStorage.getItem("noticia");

//console.log("Este importa" + noticiaSeleccionada);

fetch('http://ec.espol.edu.ec/api/noticia')
        .then((arregloNoticias) => {
            return arregloNoticias.json();
        } ).then((arregloNoticias) => {




        	arregloNoticias.noticias.forEach(function(objeto) {

        		//console.log(objeto);

                    objeto.articulos.forEach(function(article) {
                    	//console.log(article);

                        k++;

                        if (k == noticiaSeleccionada){
                        	console.log(article);
                        	document.getElementById('tituloNoticiaEspecifica').innerHTML = article.titulo;
                        	document.getElementById('contenidoNoticiaEspecifica').innerHTML = article.contenido;
                            document.getElementById('imagenNoticiaEspecifica').src = "http://www.ec.espol.edu.ec" + article.imagen;
                            document.getElementById('fechaNoticiaEspecifica').innerHTML = objeto.publicacion;
                        }

                        //try {
                        
                        //document.getElementById('tituloNoticia' + k).innerHTML = article.titulo;
                        //document.getElementById('contenidoNoticia' + k).innerHTML = article.contenido;
                        //document.getElementById('imagenNoticia' + k).src = "http://www.ec.espol.edu.ec" + article.imagen;
                        //console.log("http://www.ec.espol.edu.ec" + article.imagen)

                        //}catch(err){
                        //    console.log(err);
                        //}

                    	//})



            });












            //document.getElementById('categoriaCurso').innerHTML = arregloProspectos.prospectos[cursoSeleccionado].area.nombre;
            //document.getElementById('imagenCursoEspecifico').src = "http://www.ec.espol.edu.ec" + arregloProspectos.prospectos[cursoSeleccionado].imagen;
            //document.getElementById('nombreCursoEspecifico').innerHTML = arregloProspectos.prospectos[cursoSeleccionado].nombre;
            //document.getElementById('descripcionCursoEspecifico').innerHTML = arregloProspectos.prospectos[cursoSeleccionado].contenido.objetivo
        });

   });