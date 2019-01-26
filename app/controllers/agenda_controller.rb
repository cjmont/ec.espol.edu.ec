require 'date'
class AgendaController < ApplicationController
	def index
		@calendario = getCalendario()
		@fecha = Time.now()
	end
end

def getCalendario
	mes = Array.new
	anio_actual = Integer(Time.now().strftime("%Y"))
	mes_actual = Integer(Time.now().strftime("%m"))
	primerDia = Date.new(anio_actual,mes_actual,01)
	primerDiaNum = Integer(primerDia.wday())
	for i in 1..primerDiaNum
		primerDia = primerDia.prev_day()
	end
	fecha = primerDia
	for i in 1..5
		semana = Array.new
		for f in 1..7
			fecha = fecha.next_day()
			semana.push(fecha.strftime("%d"))
		end
		mes.push([semana])
	end
	return mes
end 