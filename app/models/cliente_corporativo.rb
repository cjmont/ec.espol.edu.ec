class ClienteCorporativo < ActiveRecord::Base
	belongs_to :estado

	validates :empresa, presence: true, :length => {:in =>1..50}
	validates :nombres, presence: true, :length => {:in => 1..50}
	validates :apellidos, presence: true, :length => {:in =>1..50}
	validates :celular, presence: true, :length => {maximum: 20}
	validates :nombre_curso, presence: true, :length => {maximum: 255}

  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }
end
