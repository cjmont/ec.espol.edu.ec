class Area < ActiveRecord::Base

	has_many :prospecto
	has_many :contenido, through: :prospecto
	has_many :evento, through: :contenido

	has_attached_file :imagen, styles: { medium: "730x730>", thumb: "100x100>" }
	#do_not_validate_attachment_file_type :image
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/

end
