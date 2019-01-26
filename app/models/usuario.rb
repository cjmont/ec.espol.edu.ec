class Usuario < ActiveRecord::Base
	#validates :nombres, presence: true, :length => {:in =>3..50}
	#validates :apellidos, presence: true, :length => {:in =>3..50}
	validates :identificacion, presence: true, :length => {maximum: 20}
	#validates :empresa, presence: true, :length => {maximum: 30}
	#validates :ciudad, presence: true
	#validates :movil, presence: true, :length => {maximum: 20}
	#validates :cargo, presence: true, :length => {maximum: 50}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

end
