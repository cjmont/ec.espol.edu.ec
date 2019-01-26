class Prospecto < ActiveRecord::Base
  belongs_to :estado
  belongs_to :area
  belongs_to :prospecto

  validates :nombre, presence: true
  validates :linea_negocio, presence: true
  validates :tipo, presence: true
  validates :area, presence: true

  has_many :contenido
  #has_many :contenido_evento, through: :contenido, source: :evento

  

  has_attached_file :imagen, styles: { medium: "730x730>", thumb: "100x100>" }
	#do_not_validate_attachment_file_type :image
  validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/

  @publicado = 2
  	
  def self.starts_with(search)
  	where('nombre like ?',"#{search}%")
  end

  #OBTENER PROGRAMAS QUE COMIENCEN CON NOMBRE ESPECIFICO
  def self.buscar_programas(search)
  	where("nombre like ? AND tipo like 'Programa'","#{search}%").where(estado: @publicado)
  end
  
  #OBTENER TODOS LOS PROGRAMAS 
  def self.get_programas()
  	where("tipo like 'Programa' AND estado_id = ?", @publicado)

  end

 #OBTENER CURSOS QUE COMIENCEN CON NOMBRE ESPECIFICO
  def self.buscar_cursos(search)
  	where("nombre like ? AND tipo like 'Curso'","#{search}%").where(estado: @publicado)
  end
   #OBTENER TODOS LOS CURSOS 
  def self.get_cursos()
  	where("tipo like 'Curso' AND estado_id = ?", @publicado)
  end

 #OBTENER CONFERENCIAS QUE COMIENCEN CON NOMBRE ESPECIFICO
  def self.buscar_conferencias(search)
  	where("nombre like ? AND tipo like 'Conferencia'","#{search}%").where(estado: @publicado)
  end
    #OBTENER TODOS LAS CONFERENCIAS 
  def self.get_conferencias()
  	where("tipo like 'Conferencia'")
  end

  #MUESTRA TODAS LAS LINEAS DE NEGOCIO CORPORATIVOS DE FORMA ALEATORIA
  def self.buscar_Corporativo()
    where(linea_negocio: 'Corporativo').order("RAND()")
  end
  #OBTENER EL PROSPECTO MEDIANTE EL ID DE PROSPECTO
  def self.get_prospectos(id_prospectos)
    where(id: id_prospectos)
  end

  def self.get_diplomado()
    where("tipo like 'Diplomado' AND estado_id = ?", @publicado)
  end

end
