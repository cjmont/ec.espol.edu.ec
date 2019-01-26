class Interese < ActiveRecord::Base
	belongs_to :area
	belongs_to :usuario
	belongs_to :prospecto
	belongs_to :estado
end
