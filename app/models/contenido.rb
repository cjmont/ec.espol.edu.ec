class Contenido < ActiveRecord::Base
  belongs_to :prospecto
  belongs_to :especialidad

  has_many :evento
  has_many :dirigido

  validates :prospecto_id, presence: true
  validates :descripcion, presence: true
  validates :modalidad, presence: true
  validates :version, presence: true

  #OBTNER CONTENIDO MEDIANTE UN ID DE CONTENIDO
  def self.get_contenidos(contenidos_id)
  	where(id: contenidos_id)
  end

  #OBTENER CONTENIDO DE UN PROSPECTO
  def self.get_contenido(prospecto_id)
  	where(prospecto_id: prospecto_id).order(:version).take(1)

  end



end
