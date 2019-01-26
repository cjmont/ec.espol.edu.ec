class Calendario < ActiveRecord::Base
  before_destroy :ensure_not_item_calendario
  has_many :item_calendarios


  #accepts_nested_attributes_for :curso
  #accepts_nested_attributes_for :programa
  
  #accepts_nested_attributes_for :seminario

  def ensure_not_item_calendario
  		if item_calendarios.empty?
  			return true
  		else
  			errors.add(:base, 'Usted tiene Curso(s) registrado(s)')
  			return false
  		end
  	end

end