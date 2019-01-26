class Nivel < ActiveRecord::Base
	belongs_to :contenido
	belongs_to :nivel
end
