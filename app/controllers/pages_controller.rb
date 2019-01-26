class PagesController < ApplicationController
  require 'date'

	include CurrentLista
  #include ActionView::Helpers::DateHelpers

  respond_to :js
	
	before_action :set_lista, only: [:index, :shop, :cliente, :about, :calendario, :sedes, :identidad, :certificaciones, :capacitaciones, :condiciones,:contenidos]

  def index
    @area = Area.all.page params[:page]
    
    @newsletter = Articulo.buscar_articulo("newsletter")
    @newsletter_publicacion =  Articulo.buscar_publicacion.to_s.to_date

    @info = Articulo.buscar_articulo("infoec")
    @info_publicacion =  Articulo.buscar_publicacion.to_s.to_date

    #FUNCION PARA LA PARTE DE PROXIMO EVENTOS 
    @proximos_eventos = Evento.joins(:contenido => :prospecto).where("eventos.fecha_inicio > ? and ( prospectos.curso > 1 or prospectos.curso is null) and (prospectos.estado_id = ?)",Time.now,2 ).order("eventos.fecha_inicio asc").select("prospectos.nombre AS nombre").limit(3)

  end

def sedes
end

def nosotros
end

def identidad
end

def certificaciones
end
  
  #def calendario_params
  #  params.require(:calendario).permit(:dianumero, :dialetra, :mes, :anio, :hora, :descripccion)
  #end
  def shop
    #@cursos = Curso.all.page params[:page]
    #@programas = Programa.all.page params[:page]
    #@seminarios = Seminario.all.page params [:page]

  end 

  def programa
    @id = 1
    @programas = Prospecto.all.page params[:page]
    @contenido_programa = Contenido.first
    @contenidos = Contenido.where(prospecto_id: @id).take
  end 

  #def infocurso
   # @infoc = Curso.find(params[:curso_id])
    #@cursos = Curso.all
    #@d=Date.today.month

    #@calendarios = Calendario.all
    #@fecha_actual = Time.now.strftime("%y-%m-%d")
    #@dia_semana= Time.now.strftime("%A")

    #respond_to do |format|
      #format.html
      #format.pdf do
        #pdf= CursoPdf.new(@cursos, @infoc.id,@calendarios)
        #send_data pdf.render, type:"application/pdf",
         #                     disposition: "inline"
      #end
    #end

  end

  def cliente
  end


  def about
  end

  #def seminario
      #@seminarios = Seminario.all.page params[:page]
      
      #@d=Date.today.month

      #@calendarios = Calendario.all
      #@fecha_actual = Time.now.strftime("%y-%m-%d")
      #@dia_semana= Time.now.strftime("%A")
  #end

  def calendario
     @calendarios = Calendario.all
     @fecha_actual = Time.now
     @mes_actual = Time.now.strftime("%B ")
     @dia_semana= Time.now.strftime("%A")
     @mes = params[:mes]

    #@dia_semana = Calendario.find(params[:calendario_id])
  end
  def capacitaciones
  end
  def contenido
    @contenido = Contenido.all
  end