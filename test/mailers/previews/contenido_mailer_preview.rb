# Preview all emails at http://localhost:3000/rails/mailers/contenido_mailer
class ContenidoMailerPreview < ActionMailer::Preview
	def confirmacionDescargaContenido_email
		ContenidoMailer.confirmacionDescargaContenido_email
	end

	def confirmacionRegistroCurso
		ContenidoMailer.confirmacionRegistroCurso(user: User.first, prospecto: Prospecto.first, evento: Evento.first)
	end
end