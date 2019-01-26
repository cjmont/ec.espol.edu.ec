class Evento < ActiveRecord::Base
  belongs_to :contenido
  validates :contenido_id, presence: true
  validates :fecha_inicio, presence: true


# BUSCA TODOS LOS EVENTOS PLANIFICADOS DE UN PROSPECTO Y DEVUELVE EL MAS PROXIMO
  def self.eventos_planificados(contenido, fecha)
    where("contenido_id = ? and fecha_inicio >= ?", contenido, fecha)
  end
end
