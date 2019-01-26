class ContenidoMailer < ApplicationMailer
	
	def confirmacionDescargaContenido_email(usuario,prospecto, contenido)

		@url  = "http://200.10.147.137"
		@usuario = usuario
		@prospect = prospecto
		attachments[prospecto.nombre + '.pdf'] = generarPDF(prospecto, contenido)
		mail(to: usuario.email, subject: 'Educación Continua - Espol')
	end

	def confirmacionRegistroCurso(usuario, prospecto, evento)
		@url  = "http://200.10.147.137"
		@usuario = usuario
		@prospecto = prospecto
		@evento = evento
		mail(to: usuario.email, subject: 'Educación Continua - Espol')
	end

private
	def generarPDF(prospecto, contenido)
		dirigido_a = getDirigido(contenido.id)
		requisitoInd = getRequisitos(contenido.id, "Indispensable")
		requisitoRec = getRequisitos(contenido.id, "Recomendado")
		unidades = getContenido(contenido.id, prospecto)
		eventos = getEventos(contenido.id)
		Prawn::Document.new do
			image "#{Rails.root}/app/assets/images/Prospectos/pdf/cabecera.png", :at =>  [-36, 760], :width => 615

			#TIPO DE PROSPECTO
			bounding_box([0, 670], :width => 540 , :height => 50, :position => :center) do
				move_down 20
				fill_color "FFFFFF"
				text prospecto.tipo.upcase, :size => 23, :align => :center
			end
			#NOMBRE DEL CURSO
			bounding_box([-10, 625], :width => 560, :height => 70, :position => :center) do
				move_down 15
				fill_color "000839"
				text prospecto.nombre, :size => 20, :align => :center
			end

			image "#{Rails.root}/app/assets/images/Prospectos/pdf/edificio.png", :at =>  [-37, 550], :width => 625

			#AREA
			bounding_box([10, 280], :width => 100, :height => 25, :position => :center) do
				move_down 5
				fill_color '007A84'
				text "Área", :size => 16, :align => :center
			end

			bounding_box([10, 258], :width => 100, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 100, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([10, 245], :width => 100, :height => 50, :position => :center) do
				move_down 0
				fill_color "000000"
				text prospecto.area.nombre, :size => 12, :align => :center
			end

			#CREDITO
			bounding_box([135, 280], :width => 100, :height => 25, :position => :center) do
				move_down 5
				fill_color '007A84'
				text "Duración", :size => 16, :align => :center
			end

			bounding_box([135, 258], :width => 100, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 100, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([135, 240], :width => 100, :height => 30, :position => :center) do
				move_down 0
				fill_color "000000"
				text (contenido.horas_presenciales ).to_s + " Horas", :size => 12, :align => :center
			end

			#MODALIDAD

			bounding_box([260, 280], :width => 100, :height => 25, :position => :center) do
				move_down 5
				fill_color '007A84'
				text "Modalidad", :size => 16, :align => :center
			end

			bounding_box([260, 258], :width => 100, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 100, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([260, 240], :width => 100, :height => 30, :position => :center) do
				move_down 0
				fill_color "000000"
				text contenido.modalidad, :size => 12, :align => :center
			end

			#TIPO DE CERTIFICADO
			bounding_box([380, 280], :width => 135, :height => 25, :position => :center) do
				move_down 5
				fill_color '007A84'
				text "Tipo de Certificado", :size => 16, :align => :center
			end

			bounding_box([380, 258], :width => 135, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 100, 1, 0
		            fill_color 'FFFFFF'
		        end
			end
		
			bounding_box([380, 240], :width => 135, :height => 30, :position => :center) do
				move_down 0
				fill_color "000000"
				text contenido.certificado, :size => 12, :align => :center
			end

			#DESCRIPCION
			bounding_box([5, 180], :width => 516, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "DESCRIPCIÓN", :size => 18, :align => :left
			end

			
			bounding_box([5, 155], :width => 516, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([5, 150], :width => 506, :height => 110) do
				move_down 10
				fill_color '000000'
				text contenido.descripcion, :size => 12, :align => :justify

			end

			image "#{Rails.root}/app/assets/images/Prospectos/pdf/footer.png", :at =>  [-37, 50], :width => 620

			start_new_page   #PAGINA 2
			image "#{Rails.root}/app/assets/images/Prospectos/pdf/foto-costado-1.jpg", :at =>  [380, 810], :width => 200

			#OBJETIVO

			bounding_box([5, 730], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "OBJETIVO", :size => 18, :align => :left
			end

			
			bounding_box([5, 705], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([5, 700], :width => 340, :height => 110) do
				move_down 10
				fill_color '000000'
				text contenido.objetivo, :size => 12, :align => :justify

			end

			#DIRIGIDO A

			bounding_box([5, 585], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "DIRIGIDO A", :size => 18, :align => :left
			end

			
			bounding_box([5, 560], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			acumuladoAltura = 0
			dirigido_a.each_with_index do |dirigido, index|
				if dirigido.length <= 1
					total = dirigido[0].length * 6 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(340)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA

					bounding_box([5, 550 - acumuladoAltura - (index * 5)], :width => 340, :height => altura) do
						fill_color '000000'
						text dirigido[0], :size => 12, :align => :justify , :inline_format => true
						move_down 10
					end
					acumuladoAltura += altura
				else 
					total = dirigido[1].length * 6 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(320)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA

					stroke do
			            stroke_color '007A84'
			            fill_color '007A84'
			            fill_and_stroke_rounded_rectangle [10, 548 - acumuladoAltura - (index * 5)], 5, 5, 0
			            fill_color 'FFFFFF'
			        end
					bounding_box([25, 550 - acumuladoAltura - (index * 5)], :width => 320, :height => altura) do
						fill_color '000000'
						text dirigido[1], :size => 12, :align => :justify , :inline_format => true
						move_down 10
					end
					acumuladoAltura += altura
				end
			end
				

			#REQUISITO INDISPENSABLE

			bounding_box([5, 350], :width => 350, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "PERFIL DEL PARTICIPANTE", :size => 18, :align => :left
			end

			
			bounding_box([5, 325], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			move_down 6

			bounding_box([5, 315], :width => 350, :height => 25, :position => :center) do
				move_down 6
				fill_color '000000'
				text "Requisitos Indispensables", :size => 16, :align => :left
			end

			acumuladoAltura = 0
			requisitoInd.each_with_index do |requisito, index|
				if requisito.length <= 1
					total = requisito[0].length * 7 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(340)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA
					bounding_box([25, 280 - acumuladoAltura - (index * 5)], :width => 320, :height => altura) do
						fill_color '000000'
						text requisito[0], :size => 12, :align => :justify , :inline_format => true
					end
					acumuladoAltura += altura
				else 
					total = requisito[1].length * 6 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(320)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA
					stroke do
			            stroke_color '007A84'
			            fill_color '007A84'
			            fill_and_stroke_rounded_rectangle [10,278 - acumuladoAltura - (index * 5)], 5, 5, 0
			            fill_color 'FFFFFF'
			        end
					bounding_box([25, 280 - acumuladoAltura - (index * 5)], :width => 320, :height => altura) do
						fill_color '000000'
						text requisito[1], :size => 12, :align => :justify , :inline_format => true
						move_down 10
					end
					acumuladoAltura += altura
				end
			end

			#REQUISITO RECOMENDABLE

			bounding_box([5, 205], :width => 350, :height => 25, :position => :center) do
				move_down 6
				fill_color '000000'
				text "Requisitos Recomendables", :size => 16, :align => :left
			end

			acumuladoAltura = 0
			requisitoRec.each_with_index do |requisito, index|
				if requisito.length <= 1
					total = requisito[0].length * 6 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(340)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA
					
					bounding_box([25, 170 - acumuladoAltura - (index * 5)], :width => 320, :height => altura) do
						fill_color '000000'
						text requisito[0], :size => 12, :align => :justify , :inline_format => true
						move_down 10
					end
					acumuladoAltura += altura
				else 
					total = requisito[1].length * 6 #ANCHO DEL CARACTER MAS GRANDE
					lineas = total / Float(320)
					altura = lineas.ceil * 14 #ALTURA DE LA LINEA

					stroke do
			            stroke_color '007A84'
			            fill_color '007A84'
			            fill_and_stroke_rounded_rectangle [10,168 - acumuladoAltura - (index * 5)], 5, 5, 0
			            fill_color 'FFFFFF'
			        end
					bounding_box([25, 170 - acumuladoAltura - (index * 5)], :width => 320, :height => altura) do
						fill_color '000000'
						text requisito[1], :size => 12, :align => :justify , :inline_format => true
						move_down 10
					end
					acumuladoAltura += altura
				end
			end

			image "#{Rails.root}/app/assets/images/Prospectos/pdf/footer.png", :at =>  [-37, 50], :width => 620

			start_new_page   #PAGINA 3
			image "#{Rails.root}/app/assets/images/Prospectos/pdf/foto-costado-2.jpg", :at =>  [380, 810], :width => 200

			#METODOLOGIA

			bounding_box([5, 730], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "METODOLOGÍA", :size => 18, :align => :left
			end

			
			bounding_box([5, 705], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([5, 700], :width => 340, :height => 350) do
				move_down 10
				fill_color '000000'
				text contenido.metodologia, :size => 12, :align => :justify

			end

			#CONTENIDO

			bounding_box([5, 370], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "CONTENIDO", :size => 18, :align => :left
			end

			
			bounding_box([5, 345], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end
	
			acumuladoAltura = 0
			unidades.each_with_index do |unidad, index|
				total = (unidad[1] + " (" + unidad[2].to_s + " Horas)").length * 6 #ANCHO DEL CARACTER MAS GRANDE
				lineas = total / Float(270)
				altura = lineas.ceil * 14 #ALTURA DE LA LINEA

				bounding_box([5, 335 - acumuladoAltura - (index * 5)], :width => 80, :height => altura) do
					move_down 0
					fill_color '007A84'
					text "<b>"+unidad[0]+"</b>", :size => 13, :align => :justify, :inline_format => true
				end
				bounding_box([85, 335 - acumuladoAltura - (index * 5)], :width => 270, :height => altura) do
					move_down 0
					fill_color '000000'
					text unidad[1] + " (" + unidad[2].to_s + " Horas)", :size => 12, :color => "000000"
				end
				acumuladoAltura += altura
			end

			image "#{Rails.root}/app/assets/images/Prospectos/pdf/footer.png", :at =>  [-37, 50], :width => 620

			start_new_page   #PAGINA 3
			image "#{Rails.root}/app/assets/images/Prospectos/pdf/foto-costado-3.jpg", :at =>  [380, 810], :width => 200

			#PROXIMOS EVENTOS
			bounding_box([5, 730], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "PRÓXIMOS EVENTOS", :size => 18, :align => :left
			end

			
			bounding_box([5, 705], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			eventos.each_with_index do |evento, index|
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [10,688 - (index *20)], 5, 5, 0
		            fill_color 'FFFFFF'
		        end
				bounding_box([25, 690 - (index * 20)], :width => 315, :height => 25) do
					move_down 0
					fill_color '000000'
					text evento, :size => 11, :color => "000000"
				end
			end
				
			#FORMAS DE PAGO

			bounding_box([5, 600], :width => 200, :height => 25, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "FORMAS DE PAGO", :size => 18, :align => :left
			end

			bounding_box([5, 575], :width => 350, :height => 1, :position => :center) do
				stroke_bounds
				move_down 6
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [0,1], 350, 1, 0
		            fill_color 'FFFFFF'
		        end
			end

			bounding_box([25, 570], :width => 300, :height => 200) do
				move_down 10
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [-15,188], 5, 5, 0
		            fill_color 'FFFFFF'
		        end
				fill_color '000000'
				text "Cheque Certificado a nombre de ESPOL-TECH E.P.", :size => 12, :align => :left

				move_down 10
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [-15,164], 5, 5, 0
		            fill_color 'FFFFFF'
		        end
		        fill_color '000000'
				text "Tarjeta de Débito/Crédito", :size => 12, :align => :left

				move_down 5

				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_circle [2,143], 2
		            fill_color 'FFFFFF'
		        end
		        stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_circle [2,115], 2
		            fill_color 'FFFFFF'
		        end
		        fill_color '000000'
				indent(10) do
					text "Corriente: Visa, Mastercard, Discover, American Express y Diners Club.", :size => 12
					text "Diferido: Diners Club", :size => 12
				end

				move_down 10
				stroke do
		            stroke_color '007A84'
		            fill_color '007A84'
		            fill_and_stroke_rounded_rectangle [-15,93], 5, 5, 0
		            fill_color 'FFFFFF'
		        end
		         fill_color '000000'
				text "Depósito o Transferencia Bancaria", :size => 12, :align => :left

				move_down 5
				indent(10) do
					text "<color rgb='007A84'>Razón social: </color> Empresa Pública de Servicios ESPOLTECH E.P.", :size => 12, :inline_format => true
					text "<color rgb='007A84'>RUC: </color> 0968592010001", :size => 12, :inline_format => true
					text "<color rgb='007A84'>Cta. Cte. Banco Pacífico: </color> #7427786", :size => 12, :inline_format => true
					text "<color rgb='007A84'>Cta. Cte. Banco Guayaquil: </color> #1113864-0", :size => 12, :inline_format => true
				end
			end

			#INVERSION
			bounding_box([35, 350], :width => 125, :height => 50, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "INVERSIÓN", :size => 18, :align => :center
			end
			bounding_box([160, 350], :width => 125, :height => 50, :position => :center) do
				move_down 5
				fill_color '000000'
				text contenido.precio.to_s + " USD" , :size => 18, :align => :center
			end

			#MÁS INFORMACIÓN
			bounding_box([35, 290], :width => 230, :height => 80, :position => :center) do
				stroke_bounds
				move_down 6
				text "<color rgb='007A84'>Para más información:</color>", :size => 18, :align => :center, :inline_format => true
				move_down 5
				indent(50) do
					text "educon@espol.edu.ec", :size => 15,  :align => :left, :inline_format => true
					move_down 6
					text "0960507588", :size => 15,  :align => :left, :inline_format => true
				end
				image "#{Rails.root}/app/assets/images/Prospectos/pdf/correo.png", :at =>  [20, 52], :width => 20
				image "#{Rails.root}/app/assets/images/Prospectos/pdf/whats.png", :at =>  [20, 29], :width => 20
			end

			#UBICANOS
			bounding_box([80, 190], :width => 125, :height => 40, :position => :center) do
				move_down 6
				fill_color '007A84'
				text "Ubícanos", :size => 23, :align => :center
				image "#{Rails.root}/app/assets/images/Prospectos/pdf/ubicacion.png", :at =>  [120, 40], :width => 20
			end
			bounding_box([30, 160], :width => 250, :height => 100, :position => :center) do
				move_down 6
				fill_color '686868'
				text "<a href='https://www.youtube.com/watch?v=z_ZK3bdqPGg' target='_blank'>Campus Peñas</a>", :size => 15, :align => :center, :inline_format => true
				move_down 6
				fill_color '686868'
				text "<a href='https://www.youtube.com/watch?v=H0OHUS_4UaY' target='_blank'>Campus Prosperina</a>", :size => 15, :align => :center, :inline_format => true
			end

			image "#{Rails.root}/app/assets/images/Prospectos/pdf/footer.png", :at =>  [-37, 50], :width => 620

		end.render
	end

	private 
	def getRequisitos(contenido, tipo)
		requisitos = PerfilPersonas.where(contenido_id: contenido).where(tipo_requisito: tipo)
		requisitosArr = Array.new
		texto = ""
		requisitos.each do |r|
			requisito = Array.new
			if r.tipo == "Viñeta" || r.tipo == "VIÑETA"
				requisito.push("-")
			end
			requisito.push(r.texto)
			requisitosArr.push(requisito)
		end
		if requisitosArr.length == 0
			requisito = Array.new 
			requisito.push("No requerido.")
			requisitosArr.push(requisito) 
		end
		return requisitosArr
	end

	private
	def getDirigido(contenido)
		dirigidos = Dirigido.where(contenido_id: contenido)
		dirigidoArr = Array.new
		dirigidos.each do |d|
			dirigido = Array.new 
			if d.tipo == "Viñeta" || d.tipo == "VIÑETA"
				dirigido.push("-")
			end
			dirigido.push(d.texto)
			dirigidoArr.push(dirigido)
		end
		if dirigidoArr.length == 0
			dirigido = Array.new 
			dirigido.push("Público en general.")
			dirigidoArr.push(dirigido) 
		end
		return dirigidoArr
	end

	private 
	def getContenido(contenido,prospecto)
		numR = ["I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV"]
		objetos = nil
		nombreNivel = nil

		unidadesArr = Array.new

		if prospecto.tipo == "Programa" or prospecto.tipo == "Diplomado"
			nombreNivel = "Curso"
			objetos = Prospecto.where(prospectos_id: prospecto.id).order(:curso)

		else
			nombreNivel = "Unidad"
			objetos = Nivel.where(contenido_id: contenido).where(nivel_id: nil).order(:unidad)
		
		end

		objetos.each_with_index do |ob,index|
				unidad = Array.new
				unidad.push(nombreNivel + " " + numR[index] + ": " )
				unidad.push(ob.nombre)

				if prospecto.tipo == "Programa" or prospecto.tipo == "Diplomado"
					contenido = Contenido.where(prospecto_id: ob.id)
					unidad.push(contenido[0].horas_presenciales)
				else
					unidad.push(ob.credito)
				end

				unidadesArr.push(unidad)
		end

		return unidadesArr
	end

	private
	def getEventos(contenido)
		eventosArr = Array.new
		eventos = Evento.where(contenido_id: contenido).where("fecha_inicio >= ?", DateTime.now).order(fecha_inicio: :asc).limit(3)
		if eventos.length > 0
			eventos.each do |e|
				evento = e.fecha_inicio.to_formatted_s(:rfc822)
				fecha = evento.split(" ")
				fecha = fecha[1] + ", " + fecha[2] + " del " + fecha[3]
				eventosArr.push(fecha)
			end 
		else 
			eventosArr.push("Confirmación en proceso. ¡Comunicate con nosotros!")
		end
		return eventosArr
	end

	private 
	def getAltura(ancho, chars)
		total = chars * 9 #ANCHO DEL CARACTER MAS GRANDE
		lineas = total / Float(ancho)
		altura = lineas.ceil * 13 #ALTURA DE LA LINEA
		return altura
	end
end
