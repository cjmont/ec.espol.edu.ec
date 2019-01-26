

function CambiaEstados(){
    //var todos= document.getElementById("todos").innerHTML ;
    //var programas= document.getElementById("programa").innerHTML ;
    //var cursos= document.getElementById("cursos").innerHTML ;
    //var conferencias= document.getElementById("conferencias").innerHTML ;
     //alert("entro en function")



if ($('.tab-todos').hasClass( "active in" )){

    $('.tab-todos').addClass('active in');
    //alert("entro en todos")
}
else if ($('.tab-programas').hasClass( "active in" )) {
    $('.tab-todos').removeClass('active in');
    $('.tab-programas').addClass('active in');
    
    //alert("entro en programa")
}
else if ($('.tab-cursos').hasClass( "active in" )) {
    $('.tab-todos').removeClass('active in');
    $('.tab-cursos').addClass('active in');
    
    //alert("entro en cursos")
}
else if ($('.tab-conferencias').hasClass( "active in" )) {
    $('.tab-todos').removeClass('active in');
    $('.tab-conferencias').addClass('active in');
    
    //alert("entro en conferencias")
}

}
