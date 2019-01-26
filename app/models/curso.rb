class Curso < ActiveRecord::Base
  belongs_to :contenido

  def self.starts_with(search)
  	where('titulo like ?',"#{search}%")
  end
end
