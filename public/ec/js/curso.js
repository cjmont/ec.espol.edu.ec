//console.log("Entramos a cursos");

var cursoSeleccionado = localStorage.getItem("curso");

//console.log("Este importa" + cursoSeleccionado);

fetch('http://ec.espol.edu.ec/api/prospecto')
        .then((arregloProspectos) => {
            return arregloProspectos.json();
        } ).then((arregloProspectos) => {

             arregloProspectos.prospectos.forEach(function(objeto) {
                if (objeto.id == cursoSeleccionado){

            document.getElementById('categoriaCurso').innerHTML = objeto.area.nombre;
            document.getElementById('imagenCursoEspecifico').src = "http://www.ec.espol.edu.ec" + objeto.imagen;
            document.getElementById('nombreCursoEspecifico').innerHTML = objeto.nombre;
            document.getElementById('descripcionCursoEspecifico').innerHTML = objeto.contenido.descripcion;
            document.getElementById('metodologiaCursoEspecifico').innerHTML = objeto.contenido.metodologia;
            document.getElementById('sectorCurso').innerHTML = objeto.area.sector;
            document.getElementById('dirigido').innerHTML = objeto.contenido.dirigido[0].texto;
            //console.log(parseInt(objeto.contenido.horas_presenciales));
            //console.log(parseInt(objeto.contenido.horas_virtuales) || 0);
            //console.log(parseInt(objeto.contenido.horas_autonomas) || 0);
            var horas = (parseInt(objeto.contenido.horas_presenciales)|| 0) + (parseInt(objeto.contenido.horas_virtuales)|| 0) + (parseInt(objeto.contenido.horas_autonomas)|| 0)
            document.getElementById('horasTotales').innerHTML = horas + " Horas";



                }

             });
            //console.log(arregloProspectos.prospectos[cursoSeleccionado])
            

        })