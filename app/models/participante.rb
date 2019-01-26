class Participante < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :evento
	belongs_to :estado

end
