class Contact < ActiveRecord::Base
	belongs_to :estado
	
	validates :nombre, presence: true, :length => {:in => 3..20}
	validates :mensaje, presence: true, :length => {maximum: 300}

  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

end
